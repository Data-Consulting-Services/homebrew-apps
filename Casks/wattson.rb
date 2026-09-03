cask "wattson" do
  version "0.1.18"
  sha256 "c13652d0fa17d5824f11f1ee48668e2fe1d21a31ece2d48e1d7972c9c28dfb5a"

  url "https://dataconsultingservices.net/downloads/Wattson-#{version}.dmg"
  name "Wattson"
  desc "Menu bar recorder of per-app energy usage over time"
  homepage "https://dataconsultingservices.net/apps/wattson/"

  livecheck do
    url "https://dataconsultingservices.net/apps/wattson/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # No in-app updater in v1 — Homebrew owns updates (brew upgrade wattson).
  depends_on macos: :sonoma

  app "Wattson.app"

  uninstall launchctl: "com.dcs.wattson.daemon",
            quit:      "com.dcs.wattson"

  zap trash: [
    "~/Library/Application Support/Wattson",
    "~/Library/Preferences/com.dcs.wattson.plist",
    "~/Library/Saved Application State/com.dcs.wattson.savedState",
  ]
  # The root-owned store survives zap by design (unprivileged brew cannot
  # remove it): sudo rm -rf "/Library/Application Support/Wattson"
end
