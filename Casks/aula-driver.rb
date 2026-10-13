cask "aula-driver" do
  version "1.0.1"
  sha256 "707dfa6cec8ef0b0f580434f9f1386c7a5e2196e514b481039f6c88cac455c51"

  url "https://github.com/meitar/aula-driver/releases/download/v#{version}/AulaDriverApp-v#{version}.zip"
  name "Aula Driver"
  desc "macOS companion driver app for Aula F108 Pro mechanical keyboard"
  homepage "https://github.com/meitar/aula-driver"

  depends_on macos: :ventura

  app "AulaDriverApp.app"

  zap trash: [
    "~/Library/Application Support/com.aulakit.driver",
    "~/Library/Preferences/com.aulakit.driver.plist",
  ]

  caveats <<~EOS
    If macOS blocks opening "#{appdir}/AulaDriverApp.app" due to Apple Gatekeeper:
      xattr -dr com.apple.quarantine "#{appdir}/AulaDriverApp.app"
    Or install directly without quarantine:
      brew install --cask --no-quarantine meitar/tap/aula-driver
  EOS
end
