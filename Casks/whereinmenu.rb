cask "whereinmenu" do
  version "1.2.1"
  sha256 "0eee70b48510a0e7e2b7de2118ac6bab5b9a69082a63676ad3f97632e3df478c"

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
