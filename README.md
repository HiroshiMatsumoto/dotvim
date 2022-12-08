# vim configuration repository

This README.md will be for memo.

## ccls

To install, follow this page

- https://github.com/MaskRay/ccls/wiki/Build

To install ccls under home directoy, add `-DCMAKE_INSTALLPREFIX` option

```
cmakke -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10/ -DCMAKE_INSTALL_PREFIX=$HOME/.local
```

## C++

1. create `Makefile`
2. generate `compile_commands.json` by running `compiledb make`

- `compiledb` is installed by `pip install compiledb` using system python, or `pyenv global` configured python

## Airline/Powerline font


To enable the triangular shaped status bar `==>`, you'll be needing

1. right font set

`Nerd Fonts` are installed on my local windows machine according to the following site.
[vim-airline](https://blog.htkyama.org/vim_airline)

Specifically, `SourceCodePro` font sets are installed.


[Source Code Pro](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)

2. right configuration in vimrc file

```
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1
```  

3. right configuration on terminal app.

For `Windows Terminal`, under `Setting` -> `Ubuntu 20.04` -> `Appearance` -> `Fontface`, choose `SauceCodePro`, then save.

The selection names might be wrongly translated since my environment is in Japanese. 
