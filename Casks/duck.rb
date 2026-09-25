# Duck, for Homebrew. Written by scripts/make-cask.py in the Duck repo.
# Do not edit by hand: make a release, then run that script again.
cask "duck" do
  version "1.1.1"
  sha256 "b576c0370c568f965425bb82cdeef47f1147554ec56a8dc69d0a327af10fddee"

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
