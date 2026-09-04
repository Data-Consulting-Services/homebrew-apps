cask "whereinmenu" do
  version "1.3.1"
  sha256 "a371ee6169e4d017e63d3b59fdf44745cc4970c292d3e221b5535c8b1c37ee9f"

  url "https://dataconsultingservices.net/downloads/WhereInMenu-#{version}.dmg"
  name "WhereInMenu"
  desc "Menu bar search for any menu item in the active app"
  homepage "https://dataconsultingservices.net/apps/whereinmenu/"

  livecheck do
    url "https://dataconsultingservices.net/apps/whereinmenu/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # WhereInMenu updates itself from the same latest.json this livecheck reads.
  # Without this, Homebrew believes it owns the installed version and fights
  # the built-in updater — reinstalling an older pinned build over a
  # self-updated app, or reporting permanent version drift.
  auto_updates true
  depends_on macos: :sonoma

  app "WhereInMenu.app"

  uninstall quit: "com.whereinmenu.app"

  zap trash: [
    "~/Library/Caches/com.whereinmenu.app",
    "~/Library/HTTPStorages/com.whereinmenu.app",
    "~/Library/Preferences/com.whereinmenu.app.plist",
    "~/Library/Saved Application State/com.whereinmenu.app.savedState",
  ]
end
