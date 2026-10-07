import Foundation

struct Command: Identifiable {
    let cmd: String
    let note: String
    var id: String { cmd }
}

struct Sheet {
    let kind: String
    let title: String
    let symbol: String
    let commands: [Command]

    static let terminal = Sheet(
        kind: "TerminalSheet",
        title: "Terminal",
        symbol: "terminal",
        commands: [
            Command(cmd: "pwd", note: "Wo bin ich?"),
            Command(cmd: "ls -la", note: "Dateien anzeigen"),
            Command(cmd: "cd ordner", note: "In Ordner wechseln"),
            Command(cmd: "cd ..", note: "Eine Ebene hoch"),
            Command(cmd: "mkdir name", note: "Ordner anlegen"),
            Command(cmd: "touch datei", note: "Leere Datei anlegen"),
            Command(cmd: "cp a b", note: "Kopieren"),
            Command(cmd: "mv a b", note: "Verschieben / umbenennen"),
            Command(cmd: "rm datei", note: "Löschen (endgültig!)"),
            Command(cmd: "cat datei", note: "Inhalt anzeigen"),
            Command(cmd: "open .", note: "Ordner im Finder öffnen"),
            Command(cmd: "clear", note: "Bildschirm leeren"),
        ])

    static let gitBasics = Sheet(
        kind: "GitBasicsSheet",
        title: "Git: Grundlagen",
        symbol: "arrow.triangle.2.circlepath",
        commands: [
            Command(cmd: "git clone <url>", note: "Repository kopieren"),
            Command(cmd: "git status", note: "Was hat sich geändert?"),
            Command(cmd: "git add .", note: "Alles zum Commit vormerken"),
            Command(cmd: "git commit -m \"Text\"", note: "Änderungen speichern"),
            Command(cmd: "git push", note: "Zu GitHub hochladen"),
            Command(cmd: "git pull", note: "Neueste Änderungen holen"),
            Command(cmd: "git log --oneline", note: "Verlauf anzeigen"),
            Command(cmd: "git diff", note: "Änderungen ansehen"),
            Command(cmd: "git init", note: "Neues Repository anlegen"),
            Command(cmd: "git restore datei", note: "Änderung verwerfen"),
        ])

    static let gitBranches = Sheet(
        kind: "GitBranchSheet",
        title: "Git: Branches",
        symbol: "arrow.triangle.branch",
        commands: [
            Command(cmd: "git branch", note: "Alle Branches zeigen"),
            Command(cmd: "git switch -c neu", note: "Anlegen + wechseln"),
            Command(cmd: "git switch name", note: "Branch wechseln"),
            Command(cmd: "git add .", note: "Änderungen vormerken"),
            Command(cmd: "git commit -m \"Text\"", note: "Committen"),
            Command(cmd: "git push -u origin neu", note: "Branch hochladen"),
            Command(cmd: "git switch main", note: "Zurück zu main"),
            Command(cmd: "git merge neu", note: "Branch einbauen"),
            Command(cmd: "git branch -d neu", note: "Branch löschen"),
        ])

    static let all = [terminal, gitBasics, gitBranches]
}
