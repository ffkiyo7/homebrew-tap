cask "clipline" do
  version "1.0.2"
  sha256 "b44342ea66506795c4fb533349b30344a3f159c4b109438235bb4273ef281f0e"

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
