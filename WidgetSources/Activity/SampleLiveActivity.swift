import SwiftUI
import WidgetKit

struct SampleLiveActivity: Widget {

    // MARK: - Properties

    @State private var indicatorWidth: CGFloat = 200

    private let indicatorHeight: CGFloat = 20

    private var indicatorCornerSize: CGSize {
        .init(width: indicatorHeight / 2, height: indicatorHeight / 2)
    }

    // MARK: - Body

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

    // MARK: -

    private func greeting(for context: ActivityViewContext<SampleActivityAttributes>)
    -> some View {
        Text("Hello \(context.attributes.name) \(context.state.emoji)")
    }

    private func indicator(
        for context: ActivityViewContext<SampleActivityAttributes>,
    ) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerSize: self.indicatorCornerSize)
                .foregroundStyle(.blue)
                .onGeometryChange(
                    for: CGFloat.self,
                    of: { geometry in
                        geometry.size.width
                    }
                ) {
                    let _ = print("DEBUG: width: \($0)")
                    self.indicatorWidth = $0
                }
                .frame(height: self.indicatorHeight)
                .frame(maxWidth: .infinity)

            RoundedRectangle(cornerSize: indicatorCornerSize)
                .foregroundStyle(.yellow)
                .frame(width: self.indicatorWidth * context.state.progress, height: indicatorHeight)
        }
    }
}

// MARK: - Preview

#Preview("Notification", as: .content, using: SampleActivityAttributes.preview) {
    SampleLiveActivity()
} contentStates: {
    SampleActivityAttributes.ContentState.smiley
    SampleActivityAttributes.ContentState.starEyes
}
