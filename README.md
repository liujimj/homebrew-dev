# homebrew quantlib

Unofficial alternative homebrew recipe for QuantLib

## Prerequisites

```sh
$ brew reinstall gcc --without-multilib
$ brew reinstall open-mpi --c++11 --cc=gcc-5
$ brew reinstall boost --c++11 --cc=gcc-5 --with-mpi --without-single --build-from-source
$ alias brew='HOMEBREW_CC=gcc-5 HOMEBREW_CXX=g++-5 brew' # compile with g++ instead of clang++
$ brew --env
```

## Installing

```sh
$ brew tap mmizutani/dev
$ brew info mmizutani/dev/quantlib
$ brew install mmizutani/dev/quantlib
$ brew test --debug --verbose mmizutani/dev/quantlib
```

By default, both the static and dynamic libraries are built and put in `/usr/local/Cellar/quantlib/1.6.2/lib`.


## Installing with options

```sh
$ brew install --HEAD mmizutani/dev/quantlib
$ brew install --c++11 --with-openmp mmizutani/dev/quantlib
```

## Debugging

```sh
$ brew install --verbose --debug mmizutani/dev/quantlib
$ brew install --c++11 --with-openmp --verbose --debug mmizutani/dev/quantlib
$ brew audit --strict --online mmizutani/dev/quantlib
$ brew edit mmizutani/dev/quantlib
```

## Uninstalling

```sh
$ brew untap mmizutani/dev
```