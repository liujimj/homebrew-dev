# homebrew-quantlib

Unofficial alternative homebrew recipe for QuantLib

## Installing:

```sh
$ brew tap mmizutani/quantlib
$ brew info mmizutani/quantlib/quantlib
$ brew install mmizutani/quantlib/quantlib
$ brew test mmizutani/quantlib/quantlib
```

## Installing with options:

```sh
$ brew install --HEAD mmizutani/quantlib/quantlib
$ brew install --with-openmp mmizutani/quantlib/quantlib
```

## Debugging:

```sh
$ brew install --verbose --debug mmizutani/quantlib/quantlib
$ brew audit --strict --online mmizutani/quantlib/quantlib
$ brew edit mmizutani/quantlib/quantlib
```

## Uninstalling:

```sh
$ brew untap mmizutani/quantlib
```