# vim configuration repository

This README.md will be for memo.

## ccls

To install, follow this page

- https://github.com/MaskRay/ccls/wiki/Build

To install ccls under home directoy, add `-DCMAKE_INSTALLPREFIX` option

```
cmakke -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10/ -DCMAKE_INSTALL_PREFIX=$HOME/.local
```
