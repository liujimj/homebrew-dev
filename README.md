# homebrew quantlib

Unofficial alternative homebrew recipe for QuantLib

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