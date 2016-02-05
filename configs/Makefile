.PHONY: all clean split join

all: join

join: filament print printer other_settings.ini
	./helper.py --join Slic3r_config_bundle.ini

split: Slic3r_config_bundle.ini
	./helper.py --split $<

clean:
	rm -f config_bundle.ini
