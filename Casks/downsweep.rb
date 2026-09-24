cask "downsweep" do
  version "1.0.0"
  sha256 "6b3bfe2de35fc1bd03acefa2a4cd0fdfb60dc4b78887ea0f9b39796f9b15a761"

  url "https://github.com/muhghazaliakbar/downsweep/releases/download/v#{version}/Downsweep-#{version}.dmg"
  name "Downsweep"
  desc "Menu bar app that keeps the Downloads folder tidy"
  homepage "https://github.com/muhghazaliakbar/downsweep"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Downsweep.app"

  zap trash: [
    "~/Library/Application Support/Downsweep",
    "~/Library/Caches/dev.downsweep.Downsweep",
    "~/Library/HTTPStorages/dev.downsweep.Downsweep",
    "~/Library/Preferences/dev.downsweep.Downsweep.plist",
  ]

  caveats <<~EOS
    This build is not notarized yet. The first time you open Downsweep, macOS blocks it:
    open System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
