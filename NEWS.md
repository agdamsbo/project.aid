# project.aid 24.6.1

Initial version:

This package is intended as my own toolbox for helper functions in package and project management.

I tend to forget the steps needed between maintenance and feature updates, so this is the solution. I hope.

Feel free to use and modify to your liking.

## Functions

Functions and tools will fall into three (for now) categories. Some are new and some have been included in other packages of mine previously.

### Project creation and management

- `read_file()`: attempts to recognise file type by extension and imports based on relevant function. If additional arguments are needed, please just use the relevant function directly. This has no intention of being very advanced.

### Data management

- `str_extract()`: Easily extract string based on regex pattern

- `docx2list()`: attempts to ease the import of data from .docx files using the `officer`-package

### Data publishing
