import WidgetKit

struct SampleAppIntentTimelineProvider: AppIntentTimelineProvider {

    func placeholder(in context: Context) -> SampleTimelineEntry {
        .init(date: .now, configuration: SampleWidgetConfigurationIntent())
    }

    func snapshot(for configuration: SampleWidgetConfigurationIntent, in context: Context) async
        -> SampleTimelineEntry
    {
        .init(date: .now, configuration: configuration)
    }

    func timeline(for configuration: SampleWidgetConfigurationIntent, in context: Context)
        async -> Timeline<SampleTimelineEntry>
    {
        var entries: [SampleTimelineEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        for hourOffset in 0..<5 {
            let entryDate = Calendar.current.date(
                byAdding: .hour,
                value: hourOffset,
                to: .now
            )!
            let entry: SampleTimelineEntry = .init(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return .init(entries: entries, policy: .atEnd)
    }

    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}
