# Duck, for Homebrew. Written by scripts/make-cask.py in the Duck repo.
# Do not edit by hand: make a release, then run that script again.
cask "duck" do
  version "1.0.1"
  sha256 "a35d85d4f7d9371bdbf4514876b94211e2e903d461a9ba9ce33a5c35415aa965"

  url "https://github.com/hellodigitworks/Duck/releases/download/v#{version}/Duck.zip"
  name "Duck"
  desc "Hides the menu bar icons you are not using right now"
  homepage "https://duck.hellodigitworks.com/"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Duck.app"

  # Duck is free and open source, and is not signed with an Apple developer
  # certificate, which costs 99 dollars a year. macOS tags anything Homebrew
  # downloads and then refuses to open what it cannot verify, so the tag comes
  # off here and the caveats below say so. The one-line installer on the site
  # never picks the tag up in the first place: macOS only tags what a browser
  # saved, and curl is not a browser.
  postflight_steps do
    run "/usr/bin/xattr",
        args:  ["-dr", "com.apple.quarantine", "Duck.app"],
        chdir: "."
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
