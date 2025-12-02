import SwiftUI
import WidgetKit

struct SampleLiveActivity: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SampleActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.attributes.name) \(context.state.emoji)")
                indicator(for: context)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("👈")
            } compactTrailing: {
                Text("👉 \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }

    private func indicator(for context: ActivityViewContext<SampleActivityAttributes>) -> some View {
        let diameter: CGFloat = 64 * context.state.progress
        return Circle()
            .frame(width: diameter, height: diameter)
    }
}

#Preview("Notification", as: .content, using: SampleActivityAttributes.preview) {
    SampleLiveActivity()
} contentStates: {
    SampleActivityAttributes.ContentState.smiley
    SampleActivityAttributes.ContentState.starEyes
}
