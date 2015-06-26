CodeRetreat Haskell Template
============================

This is a simple [cabal](https://www.haskell.org/cabal/download.html) project
which has examples for how to write tests using hspec and QuickCheck.
It's intended to be used for CodeRetreat, but feel free to use it for
any other purpose.

Usage
-----

This requires ghc 7.8 (may work with higher/lower versions with updated dependencies)
and the cabal-install utility (which should ship with most haskell distributions).


Setup:
```sh
cabal sandbox init # Use cabal sandbox so main packages aren't tainted
cabal install --enable-tests --only-dependencies # Install normal and test
                                                 # dependencies to sandbox
```

Run main:
```sh
cabal run
```

Run ghci with project dependencies:
```sh
cabal repl
```

Run hspec tests:
```sh
cabal test
```

Tests are automatically discovered with the test/Spec.hs file.

To add new tests, create a *SomethingSomething*Spec.hs file somewhere under test/,
and define a value `spec` of type `Spec` -- take the test/FibonacciSpec.hs file as an example.
