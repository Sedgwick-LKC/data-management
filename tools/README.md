# Custom Functions & Other Tools

Scripts are meant to make interactions with data more _repeatable_ and _reproducible_, however, repeated operations within a given script should be avoided as much as possible. Instead, it's good practice to write smaller scripts that contain custom functions to do those operations. The 'actual' scripts can then load/use those functions to avoid repeating the operations inside of the functions and thus dodge the potential for error that comes with any duplication.

## Script Explanations

- Scripts with the `fxn_` prefix contain standalone functions in a format that can be safely loaded into an R environment via the `source()` function
