# Duck, for Homebrew. Written by scripts/make-cask.py in the Duck repo.
# Do not edit by hand: make a release, then run that script again.
cask "duck" do
  version "1.1.0"
  sha256 "67f2d1d2ff004c34273a3363aea8d924628dc3d176a0196f6bc7482f9caeac64"

  url "https://github.com/hellodigitworks/Duck/releases/download/v#{version}/Duck.zip"
  name "Duck"
  desc "Hides the menu bar icons you are not using right now"
  homepage "https://duck.hellodigitworks.com/"

  # Duck updates itself through Sparkle, so Homebrew should not try to upgrade it.
  auto_updates true

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Duck.app"

  uninstall quit: "com.hdw.duck"

  zap trash: [
    "~/Library/Preferences/com.hdw.duck.plist",
    "~/Library/Caches/com.hdw.duck",
  ]
end
