Haddock example
===============

Example how to build haddocs for multiple cabal packages.

Requirements  
------------

* `${GHC_9}` is a path to `ghc-9.0.1``
* `${HADDOCK}` is a path to `haddock` build from [this](https://github.com/coot/haddock/tree/coot/multiple-packages) branch (PR [#1277](https://github.com/haskell/haddock/pull/1277)).
* You might need to add `--haddock-options: --lib PATH`, where `PATH` is a path
  to haddocks resource directory ([haddock-api/resources](https://github.com/haskell/haddock/tree/ghc-9.0/haddock-api/resources)), also don't forget to add it to the `haddock` command below.


Build instructions
------------------

To build the docs directory:

```
rm rf docs/*
cabal haddock --with-compiler ${GHC_9} --with-haddock=${HADDOCK} --haddock-html --haddock-quickjump all
cp -r dist-newstyle/build/x86_64-linux/ghc-9.0.1/package-a-0.1.0.0/doc/html/package-a/ docs
cp -r dist-newstyle/build/x86_64-linux/ghc-9.0.1/package-b-0.1.0.0/doc/html/package-b/ docs
${HADDOCK} -o docs --quickjump --gen-index --gen-contents --read-interface=package-a,docs/package-a/package-a.haddock --read-interface=package-b,docs/package-b/package-b.haddock
```

To include `base` documentation, copy `base` docs from `~/.ghcup/ghc/9.0.1/share/doc/ghc-9.0.1/html/librarires/base-4.15.0.0` to `docs/base` and also include `--read-interface` option:
```
${HADDOCK} -o docs --quickjump --gen-index --gen-contents --read-interface=package-a,docs/package-a/package-a.haddock --read-interface=package-b,docs/package-b/package-b.haddock --read-interface=base,${HOME}/.ghcup/ghc/9.0.1/share/doc/ghc-9.0.1/html/libraries/base-4.15.0.0/base.haddock
```

And serve `docs` with some http server, e.g. `http-server docs`.

## Notes

`--read-interface=PATH,...`: the `PATH` must be relative url of a package it points to (relative to `docs` directory).
