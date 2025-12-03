import SwiftUI
import WidgetKit

struct SampleLiveActivity: Widget {

    var body: some WidgetConfiguration {

        ActivityConfiguration(for: SampleActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack(spacing: 8) {
                greeting(for: context)
                indicator(for: context)
            }
            .padding(8)
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    greeting(for: context)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("More Info")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    indicator(for: context)
                }
            } compactLeading: {
                Text("\(context.attributes.name.first ?? " ")")
            } compactTrailing: {
                Text("\(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }

    private func greeting(for context: ActivityViewContext<SampleActivityAttributes>)
    -> some View {
        Text("Hello \(context.attributes.name) \(context.state.emoji)")
    }

    private func indicator(for context: ActivityViewContext<SampleActivityAttributes>)
    -> some View {
        let fullWidth: CGFloat = 200
        let width: CGFloat = fullWidth * context.state.progress
        let height: CGFloat = 32
        return RoundedRectangle(cornerSize: .init(width: height / 2, height: height / 2))
            .foregroundStyle(.yellow)
            .frame(width: width, height: height)
    }
}

#Preview("Notification", as: .content, using: SampleActivityAttributes.preview) {
    SampleLiveActivity()
} contentStates: {
    SampleActivityAttributes.ContentState.smiley
    SampleActivityAttributes.ContentState.starEyes
}
