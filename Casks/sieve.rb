cask "sieve" do
  version "1.4"
  sha256 "2631ad1eedb465fbb14f330b6256fb3501c61dad907fb1f843e1054f6b6fa9a0"

  url "https://github.com/saikiran9185/sieve/releases/download/v#{version}/Sieve-#{version}.dmg"
  name "Sieve"
  desc "Provenance-first research workspace: search 14 databases, code PDFs, generate PRISMA"
  homepage "https://github.com/saikiran9185/sieve"

  depends_on macos: :sonoma

  app "Sieve.app"

  # The app is signed with the hardened runtime but not notarised — notarisation requires a
  # paid Apple Developer ID. Homebrew clears the download quarantine flag for casks, which is
  # what would otherwise make macOS refuse to open it.

  zap trash: [
    "~/Library/Preferences/com.saikiran.Sieve.plist",
    "~/Library/Saved Application State/com.saikiran.Sieve.savedState",
  ]
  caveats <<~CAVEATS
    Your library lives in ~/Documents/Sieve. It is not removed by ,
    so your reviews survive reinstalling. Delete that folder yourself if you want it gone.
  CAVEATS
end
