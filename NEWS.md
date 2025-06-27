# project.aid 25.6.1

- *NEW* added new labelling function to easily apply labels based on a named vector.

# project.aid 25.1.1

- `combn_perm()`: Extension of base::combn() to get all permutations of group size(s) m. Includes an added safety net, that stops the calculations in case of varge large number of permutations, with flag to force and option to manually set the limit. The `base::combn()` just keeps running and stalls the system. Base functionality is just like `base::combn()`.

# project.aid 25.1.1

First version to Zenodo. Still WIP.

# project.aid 24.10.1

Initial version:

This package is intended as my own toolbox for helper functions in package and project management.

I tend to forget the steps needed between maintenance and feature updates, so this is the solution. I hope.

Feel free to use and modify to your liking.

## Functions

Functions and tools will fall into three (for now) categories. Some are new and some have been included in other packages of mine previously.

### Project creation and management

- `read_file()`: attempts to recognise file type by extension and imports based on relevant function. If additional arguments are needed, please just use the relevant function directly. This has no intention of being very advanced.

- `ds2ical()`: converts data set to ical format with easy glue string for summary and description. Export .ics file with `calendar::ic_write()`.

### Data management

- `str_extract()`: Easily extract string based on regex pattern

- `docx2list()`: attempts to ease the import of data from .docx files using the `officer`-package

- `add_padding()`: add leading or tailing padding to string.

- `quantile_cut()`: Wraps `quantile()` and `cut()` to allow cutting continuous data in equal size groups or by specifying exact probs (cut points). 

### Data publishing

- `gtsummary_write()`: wrapper to export {gtsummary} table using {gt} which has been much improved recently.
