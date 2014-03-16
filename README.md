# vim-blade #

Vim syntax highlighting for Blade templates (Laravel 4).

Installation
------------

Using pathogen 
[pathogen.vim](https://github.com/tpope/vim-pathogen).  

    cd ~/.vim/bundle
    git clone git://github.com/xsbeats/vim-blade.git

Without vim-blade | With vim-blade
------------------|---------------
![before](screenshots/without.png) | ![after](screenshots/with.png)

Development
-----------

### Testing

To run all tests, run the `test.sh` script.

When expected output changes (new test, incorrect test output, change in desired
behaviour), ensure visually that the highlighting is correct and then run the 
`make-test-output.sh` script with the filename(s) of the test blade files as 
arguments. For instance, to regenerate all test ouput files:

    ./make-test-output.sh test/*.blade.php

Todo
----
- Add blade specific indentation (if, endif, etc)
