# homebrew-quantlib

Unofficial alternative homebrew recipe for QuantLib

## Installing

```sh
$ brew tap mmizutani/quantlib
$ brew info mmizutani/quantlib/quantlib
$ brew install mmizutani/quantlib/quantlib
$ brew test --debug --verbose mmizutani/quantlib/quantlib
```

By default, both the static and dynamic libraries are built and put in `/usr/local/Cellar/quantlib/1.6.2/lib`.


## Installing with options

```sh
$ brew install --HEAD mmizutani/quantlib/quantlib
$ brew install --c++11 --with-openmp mmizutani/quantlib/quantlib
```

## Debugging

```sh
$ brew install --verbose --debug mmizutani/quantlib/quantlib
$ brew install --c++11 --with-openmp --verbose --debug mmizutani/quantlib/quantlib
$ brew audit --strict --online mmizutani/quantlib/quantlib
$ brew edit mmizutani/quantlib/quantlib
```

## Uninstalling

```sh
$ brew untap mmizutani/quantlib
```