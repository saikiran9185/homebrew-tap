cask "sieve" do
  version "1.5"
  sha256 "9399f8085454e6d6763e084a9888106253f1f4c6a1ae50d342c920597f958de0"

  url "https://github.com/saikiran9185/sieve/releases/download/v#{version}/Sieve-#{version}.dmg"
  name "Sieve"
  desc "Provenance-first research workspace: search 14 databases, code PDFs, generate PRISMA"
  homepage "https://github.com/saikiran9185/sieve"

  depends_on macos: :sonoma

  app "Sieve.app"

  # Sieve is signed with the hardened runtime but not notarised by Apple, because
  # notarisation requires a paid Developer ID. Without notarisation macOS refuses to open a
  # quarantined app and reports it as damaged, and Homebrew no longer offers
  # --no-quarantine. The flag is therefore cleared here, on an app the user has explicitly
  # chosen to install from a tap they explicitly added. The download itself is still
  # verified: Homebrew checks the sha256 above against the file it fetched.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sieve.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.saikiran.Sieve.plist",
    "~/Library/Saved Application State/com.saikiran.Sieve.savedState",
  ]
  caveats <<~CAVEATS
    Your library lives in ~/Documents/Sieve. Uninstalling does not remove it, so your
    reviews survive reinstalling. Delete that folder yourself if you want it gone.
  CAVEATS
end
