import SwiftUI
import WidgetKit

struct SheetEntry: TimelineEntry {
    let date: Date
}

struct SheetProvider: TimelineProvider {
    func placeholder(in context: Context) -> SheetEntry { SheetEntry(date: .now) }
    func getSnapshot(in context: Context, completion: @escaping (SheetEntry) -> Void) {
        completion(SheetEntry(date: .now))
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<SheetEntry>) -> Void) {
        completion(Timeline(entries: [SheetEntry(date: .now)], policy: .never))
    }
}

struct SheetView: View {
    let sheet: Sheet
    @Environment(\.widgetFamily) private var family

    private var visible: [Command] {
        family == .systemLarge ? sheet.commands : Array(sheet.commands.prefix(5))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: family == .systemLarge ? 9 : 5) {
            Label(sheet.title, systemImage: sheet.symbol)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.tint)
            ForEach(visible) { c in
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(c.cmd)
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    Spacer(minLength: 4)
                    Text(c.note)
                        .font(.system(size: 11))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

private func config(_ sheet: Sheet, description: String) -> some WidgetConfiguration {
    StaticConfiguration(kind: sheet.kind, provider: SheetProvider()) { _ in
        SheetView(sheet: sheet)
    }
    .configurationDisplayName(sheet.title)
    .description(description)
    .supportedFamilies([.systemMedium, .systemLarge])
}

struct TerminalWidget: Widget {
    var body: some WidgetConfiguration {
        config(.terminal, description: "Die wichtigsten Terminal-Befehle.")
    }
}

struct GitBasicsWidget: Widget {
    var body: some WidgetConfiguration {
        config(.gitBasics, description: "Clonen, committen, pushen und pullen.")
    }
}

struct GitBranchWidget: Widget {
    var body: some WidgetConfiguration {
        config(.gitBranches, description: "Branch anlegen, wechseln und mergen.")
    }
}

@main
struct CheatSheetBundle: WidgetBundle {
    var body: some Widget {
        TerminalWidget()
        GitBasicsWidget()
        GitBranchWidget()
    }
}
