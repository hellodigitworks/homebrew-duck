# Duck, for Homebrew. Written by scripts/make-cask.py in the Duck repo.
# Do not edit by hand: make a release, then run that script again.
cask "duck" do
  version "1.4.2"
  sha256 "0074e28e33376cfdbb8738255adde5673420153ba322808db91f7790cb9a5d4c"

  url "https://github.com/hellodigitworks/Duck/releases/download/v#{version}/Duck.zip"
  name "Duck"
  desc "Hides the menu bar icons you are not using right now"
  homepage "https://duck.hellodigitworks.com/"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Duck.app"

  # Duck is free and open source, and is not signed with an Apple developer
  # certificate, which costs 99 dollars a year. macOS tags anything a browser
  # or Homebrew downloads, and refuses to open what it cannot verify, so the
  # tag is removed here. This is the same thing the one-line installer avoids
  # by using curl, which macOS does not tag. The caveats below say so plainly.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Duck.app"]
  end

  uninstall quit: "com.hdw.duck"

  zap trash: [
    "~/Library/Preferences/com.hdw.duck.plist",
    "~/Library/Caches/com.hdw.duck",
  ]

  caveats <<~EOS
    Duck is not signed with an Apple developer certificate, so this cask
    removes the quarantine tag macOS puts on downloads. Read the app's source
    at https://github.com/hellodigitworks/Duck before you trust it, the same as any
    unsigned app.
  EOS
end
