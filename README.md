# Parser

## Description

A parser for sample webserver log represented by some uri and ip address. Outputs list of visits for single uri and list of uniq visits for single uri.

## Features

- `rspec` coverage
- `rubocop` and `reek` support
- descending results in output

## Approach description

- Test-driven approach
- Solid, DDD for classes

## Possible improvements

- handling unexpected scenarios
- add simplecov for test coverage
- add i18n support

## Install, run and testing

### Pre-run steps:

```
$ cd sp-parser/
```

### Requirements:

- `rvm` or `rbenv`
- ruby 3.0.1
- bundler 2.2.15

### Grant permissions:

```
$ chmod +x bin/parser
```

### Run styleguide and code-smell checks:

```
$ rubocop
$ reek
```

### Running the tests:
- Grant executing permissions prior to running tests
```
$ rspec
```

### Running script:

```
$ bin/parser public/webserver.log
```
