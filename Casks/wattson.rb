cask "wattson" do
  version "0.1.10"
  sha256 "5eb8ce62e9a1208ca4552223ae40738f19767415b11692c226615c10b6fa087c"

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
