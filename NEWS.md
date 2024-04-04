# package.aid 0.1.0

Initial version:

This package is intended as my own toolbox for helper functions in package and project management.

I tend to forget the steps needed between maintenance and feature updates, so this is the solution. I hope.

Feel free to use and modify to your liking.

## Functions

Functions and tools will fall into three (for now) categories. Some are new and some have been included in other packages of mine previously.

### Project creation and management


### Data management

- `check_microdata()`: after having mistakenly exported microdata from the Statistics Denmark registry data servers, this function was created to help evaluate if tables contains microdata. Initially supports `gtsummary::tbl_summary()` tables. Colors problematic cells.

- `str_extract()`: Easily extract string based on regex pattern

### Data publishing
