import SwiftUI

@main
struct CheatSheetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 440, minHeight: 520)
        }
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Cheat Sheet").font(.title.bold())
                    Text("Widget hinzufügen: Rechtsklick auf den Schreibtisch → „Widgets bearbeiten“ → „Cheat Sheet“.")
                        .foregroundStyle(.secondary)
                }
                ForEach(Sheet.all, id: \.kind) { sheet in
                    VStack(alignment: .leading, spacing: 6) {
                        Label(sheet.title, systemImage: sheet.symbol).font(.headline)
                        ForEach(sheet.commands) { c in
                            HStack {
                                Text(c.cmd).font(.system(.body, design: .monospaced))
                                    .textSelection(.enabled)
                                Spacer()
                                Text(c.note).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .padding(24)
        }
    }
}
