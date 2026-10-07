# Cheat-Sheet

Ein macOS-Desktop-Widget mit den wichtigsten Befehlen für Terminal und Git/GitHub.

Es gibt drei Widgets (Medium und Groß):

- **Terminal:** `pwd`, `ls`, `cd`, `mkdir`, `cp`, `mv`, `rm` und mehr
- **Git: Grundlagen:** `clone`, `status`, `add`, `commit`, `push`, `pull`
- **Git: Branches:** Branch anlegen, wechseln, hochladen, mergen, löschen

## Voraussetzungen

- macOS 14 oder neuer
- Xcode (aus dem App Store)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen): `brew install xcodegen`
- Ein Apple-Development-Zertifikat (Xcode → Einstellungen → Accounts → Apple-ID anmelden)

## App bauen und installieren

1. Repository holen und in den Ordner wechseln:

   ```bash
   git clone https://github.com/AnnaWu82DG/Cheat-Sheet.git
   cd Cheat-Sheet
   ```

2. In `project.yml` bei `DEVELOPMENT_TEAM` deine eigene Team-ID eintragen.
   Du findest sie in Xcode unter Einstellungen → Accounts → Team.

3. Xcode-Projekt erzeugen:

   ```bash
   xcodegen generate
   ```

4. App bauen:

   ```bash
   xcodebuild -project CheatSheet.xcodeproj -scheme CheatSheet \
     -configuration Release -derivedDataPath build \
     -allowProvisioningUpdates build
   ```

   Falls `xcodebuild` meldet, dass nur die Command Line Tools aktiv sind, vorher
   `export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer` ausführen.

5. App nach `~/Applications` kopieren und einmal starten:

   ```bash
   mkdir -p ~/Applications
   cp -R build/Build/Products/Release/CheatSheet.app ~/Applications/
   open ~/Applications/CheatSheet.app
   ```

   Das Starten ist nötig, damit macOS das Widget kennenlernt.

## Widget auf den Desktop bringen

1. Rechtsklick auf den Schreibtisch → **„Widgets bearbeiten …“**.
2. Links oder oben nach **„Cheat Sheet“** suchen.
3. Ein Widget in Medium oder Groß auf den Schreibtisch ziehen.
4. Für die anderen Widgets Schritt 3 wiederholen.

Taucht das Widget nicht auf, die App noch einmal öffnen und das Widget-Fenster
schließen und neu öffnen. Notfalls kurz ab- und wieder anmelden.

## Befehle ändern

Alle Befehle stehen in `Shared/Sheets.swift`. Nach einer Änderung die Schritte 4
und 5 wiederholen.
