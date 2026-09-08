# Homebrew tap

Casks for [Sieve](https://github.com/saikiran9185/sieve), a provenance-first research
workspace for macOS.

```sh
brew install --cask saikiran9185/tap/sieve
```

Homebrew clears the download quarantine flag for casks, so the app opens without the
"damaged" warning macOS shows for anything not notarised by Apple. Notarisation needs a paid
Developer ID; the app is signed with the hardened runtime and every release publishes a
SHA-256 that Homebrew verifies.

To update: `brew upgrade --cask sieve`

Your library lives in `~/Documents/Sieve` and is not touched by uninstalling.
