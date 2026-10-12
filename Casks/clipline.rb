cask "clipline" do
  version "1.0.0"
  sha256 "e21964878ff1144f3814791ec3c5884505002988ee99596089601d58356a8104"

  url "https://github.com/ffkiyo7/Clipline/releases/download/clipline-v#{version}/Clipline-#{version}.zip"
  name "Clipline"
  desc "Screenshots and snippets, hung on a line under the menu bar"
  homepage "https://github.com/ffkiyo7/Clipline"

  livecheck do
    url :url
    regex(/^clipline[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Clipline.app"

  uninstall quit: "io.github.ffkiyo7.Clipline"

  zap trash: [
    "~/Library/Application Support/Clipline",
    "~/Library/Preferences/io.github.ffkiyo7.Clipline.plist",
  ]

  caveats <<~EOS
    Clipline is not notarized by Apple, so macOS stops it the first time.
    Run this once, then open it as usual:

      xattr -dr com.apple.quarantine /Applications/Clipline.app

    Or open it, then choose Open Anyway under
    System Settings → Privacy & Security. Later upgrades open right away.
  EOS
end
