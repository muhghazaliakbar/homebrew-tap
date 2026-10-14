cask "digby" do
  version "0.1.2"
  sha256 "7d1620449f8de169b0286cd1583503078ba97a99d8b1f6a53d8ee3cf9318e996"

  url "https://github.com/muhghazaliakbar/digby/releases/download/v#{version}/Digby-#{version}.dmg"
  name "Digby"
  desc "Native GUI for the Mole disk cleanup CLI"
  homepage "https://github.com/muhghazaliakbar/digby"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "mole"
  depends_on macos: :sonoma

  app "Digby.app"

  zap trash: [
    "~/Library/Caches/com.muhghazaliakbar.digby",
    "~/Library/HTTPStorages/com.muhghazaliakbar.digby",
    "~/Library/Preferences/com.muhghazaliakbar.digby.plist",
    "~/Library/Saved Application State/com.muhghazaliakbar.digby.savedState",
  ]

  caveats <<~EOS
    This build is not notarized yet. The first time you open Digby, macOS blocks it:
    open System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
