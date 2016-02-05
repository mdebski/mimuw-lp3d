#!/usr/bin/env python3

import argparse
import configparser
import glob
import os

KINDS = ['filament', 'print', 'printer']
EXTENSION = '.ini'
OTHER_SETTINGS_FILENAME = 'other_settings' + EXTENSION

parser = argparse.ArgumentParser(description='Split Slic3r config bundle')

def parse():
    parser.add_argument('filename', type=str, help='Bundle file name ')
    parser.add_argument('--split', dest='function', action='store_const',
                        const=run_split, default=run_error,
                        help='Split bundle into subfolders')
    parser.add_argument('--join', dest='function', action='store_const',
                        const=run_join, default=run_error,
                        help='Join files from subfolders into a bundle')
    return parser.parse_args()

def run_error():
    parser.print_help()

def run_join():
    config = configparser.RawConfigParser()
    config.read(OTHER_SETTINGS_FILENAME)

    for kind in KINDS:
        for filename in glob.iglob(os.path.join(kind, '*')):
            config.read(filename)

    with open(args.filename, 'w') as configfile:
        config.write(configfile)

def run_split():
    config = configparser.RawConfigParser()
    config.read(args.filename)

    other_settings = configparser.RawConfigParser()

    for section in config.sections():
        splits = section.split(':', 1)
        print(splits)
        if len(splits) > 1 and splits[0] in KINDS:
            kind, name = splits
            tmp = configparser.RawConfigParser()
            tmp[section] = config[section]
            with open(os.path.join(kind, name + EXTENSION), 'w') as configfile:
                tmp.write(configfile)
        else:
            other_settings[section] = config[section]

    with open(OTHER_SETTINGS_FILENAME, 'w') as configfile:
        other_settings.write(configfile)

if __name__ == '__main__':
    args = parse()
    args.function()
