cask "staysteady" do
  version "1.5.2"
  sha256 "85c524936f25e00a93656bc97918e0e66a63d9c7570675b92f7f8b34435c60e2"

  url "https://dataconsultingservices.net/downloads/StaySteady-#{version}.dmg"
  name "Stay Steady"
  desc "Free budgeting app: import bank statements, categorise on device, track savings"
  homepage "https://dataconsultingservices.net/apps/staysteady/"

  livecheck do
    url "https://dataconsultingservices.net/apps/staysteady/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # No in-app updater — Homebrew owns updates (brew upgrade staysteady).
  depends_on macos: :tahoe

  app "Stay Steady.app"

  uninstall quit: "net.dataconsultingservices.staysteady"

  # The container holds the user's transactions (SwiftData store); zap removes them.
  zap trash: [
    "~/Library/Containers/net.dataconsultingservices.staysteady",
    "~/Library/Saved Application State/net.dataconsultingservices.staysteady.savedState",
  ]
end
