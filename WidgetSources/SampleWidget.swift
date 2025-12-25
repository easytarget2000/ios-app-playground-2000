import SwiftUI
import WidgetKit

struct SampleWidget: Widget {

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: WidgetKind.staticSample,
            intent: SampleWidgetConfigurationIntent.self,
            provider: SampleAppIntentTimelineProvider()
        ) { entry in
            WidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }

}

struct WidgetEntryView: View {

    var entry: SampleAppIntentTimelineProvider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmoji)
        }
    }

}

// MARK: - Preview

extension SampleWidgetConfigurationIntent {
    
    fileprivate static var smiley: Self {
        let intent: Self = .init()
        intent.favoriteEmoji = "😀"
        return intent
    }

    fileprivate static var starEyes: Self {
        let intent: Self = .init()
        intent.favoriteEmoji = "🤩"
        return intent
    }

}

#Preview(as: .systemSmall) {
    SampleWidget()
} timeline: {
    SampleTimelineEntry(date: .now, configuration: .smiley)
    SampleTimelineEntry(date: .now, configuration: .starEyes)
}
