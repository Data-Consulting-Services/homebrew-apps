# Data Consulting Services — Homebrew Tap

Homebrew casks for [Data Consulting Services](https://dataconsultingservices.net) macOS apps.

## Usage

```bash
brew tap data-consulting-services/apps
brew install --cask whereinmenu
```

Or in one line, without tapping first:

```bash
brew install --cask data-consulting-services/apps/whereinmenu
```

### Already installed WhereInMenu manually?

Homebrew refuses to install over an app it does not manage:

```
Error: It seems there is already an App at '/Applications/WhereInMenu.app'.
```

Use `--adopt` to hand the existing install over to Homebrew instead of
reinstalling it. Your Accessibility permission and settings are preserved:

```bash
brew install --cask --adopt whereinmenu
```

## Available casks

| Cask | Description | Homepage |
|---|---|---|
| `whereinmenu` | Menu bar search for any menu item in the active app | [whereinmenu](https://dataconsultingservices.net/apps/whereinmenu/) |

## Updates

WhereInMenu updates itself — it checks `latest.json` once a day and can download
and install new versions from Settings → Updates. The cask is therefore marked
`auto_updates true`, so `brew upgrade` deliberately leaves it alone rather than
fighting the built-in updater.

To pick up a new version through Homebrew anyway:

```bash
brew reinstall --cask whereinmenu
```

## Uninstalling

```bash
brew uninstall --cask whereinmenu          # remove the app
brew uninstall --zap --cask whereinmenu    # also remove preferences and caches
```

Note that WhereInMenu needs Accessibility permission to read menu bars. Removing
the app does not revoke that grant — clear it in
System Settings → Privacy & Security → Accessibility.

## Releasing a new version

1. Build and notarize the DMG (`scripts/build-and-notarize.sh` in the app repo)
2. Upload it and update `latest.json` on the website
3. Bump `version` and `sha256` in `Casks/whereinmenu.rb`
4. Commit and push
