cask "staysteady" do
  version "1.6.4"
  sha256 "20134bed268caa96322d4fac3e04bdee14734d6562569362415ce21834d55684"

  url "https://dataconsultingservices.net/downloads/StaySteady-#{version}.dmg"
  name "Stay Steady"
  desc "Free budgeting app: import bank statements, categorise on device, track savings"
  homepage "https://dataconsultingservices.net/apps/staysteady/"

  # From 2.0 Stay Steady ships only through the Mac App Store; the DMG this url names is gone.
  disable! date: "2026-09-30", because: "is now distributed only through the Mac App Store: https://apps.apple.com/be/app/stay-steady-track-spending/id6761267044?platform=mac"

  depends_on macos: :tahoe

  app "Stay Steady.app"

  uninstall quit: "net.dataconsultingservices.staysteady"

  # The container holds the user's transactions (SwiftData store); zap removes them.
  zap trash: [
    "~/Library/Containers/net.dataconsultingservices.staysteady",
    "~/Library/Saved Application State/net.dataconsultingservices.staysteady.savedState",
  ]
end
