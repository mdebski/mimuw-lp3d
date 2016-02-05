# Configs for Slic3r
**Warning! These settings may not have been throughly tested. Please proceed with caution, use common sense, and ask if unsure!**

This serves as a repository of all possibly useful settings for working with the 3d printer using Slic3r. For clarity and ease of modification,
configs have been split to separate files, one for each preset.

## Importing
To import settings, create `Slic3r_config_bundle.ini` file using `make join` and import it to Slic3r using *File -> Load config bundle*.

## Exporting
To export settings, export bundle from Slic3r using *File -> Export config bundle*, run `make split` and use git to check and sort out changes.
The bundle should not be added to git.

## Contributing
If you encounter problems working with these configs and manage to fix them, please contribute your changes! I'll happily accept all meaningful pull requests.
Try not to change unimportant/unrelated settings. If working on something significantly different, just create a new preset (resulting in a new .ini file in one of the subdirectories).
