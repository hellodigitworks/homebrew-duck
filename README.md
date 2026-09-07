# Duck, for Homebrew

Duck hides the menu bar icons you are not using right now.
One mark in the bar. Click it and they are out of sight. Click again and they are back.

    brew tap hellodigitworks/duck
    brew install --cask duck

The app itself, and what it does and does not do, is at
[duck.hellodigitworks.com](https://duck.hellodigitworks.com/) and
[github.com/hellodigitworks/Duck](https://github.com/hellodigitworks/Duck).

macOS 13 or later, Apple silicon. Free, MIT.

## Why this list exists

Homebrew's own list only takes apps with 75 GitHub stars or more. Duck does not
have those, so it keeps its own small list here. It installs exactly the same way.

## Not signed

Duck is not signed with an Apple developer certificate, which costs 99 dollars a
year for a free app. macOS tags anything downloaded by a browser or by Homebrew
and refuses to open what it cannot verify, so this cask removes that tag after it
installs, and says so when you install it. Read the source before you trust it,
the same as you would for any unsigned app.

The one-line installer on the site avoids the tag a different way: macOS only
tags files saved by a browser, and curl is not a browser.

    curl -fsSL https://duck.hellodigitworks.com/install.sh | sh

## Keeping it current

`Casks/duck.rb` is generated. After a release, run this in the Duck repo:

    python3 scripts/make-cask.py

which rewrites the cask with the new version and its checksum.
