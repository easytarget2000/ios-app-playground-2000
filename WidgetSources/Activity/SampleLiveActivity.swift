import SwiftUI
import WidgetKit

struct SampleLiveActivity: Widget {

    // MARK: - Properties

    @State private var indicatorWidth: CGFloat = 200

    private let indicatorHeight: CGFloat = 50

    private var indicatorCornerSize: CGSize {
        .init(width: indicatorHeight / 2, height: indicatorHeight / 2)
    }

    // MARK: - Body

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SampleActivityAttributes.self) { context in
            let _ = print("DEBUG: ActivityConfiguration")

            // Lock screen/banner UI goes here
            VStack(spacing: 8) {
                greeting(for: context)
                indicator(for: context)
                longText
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
                    longText

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

    private var longText: some View {
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
        )
    }
}

// MARK: - Preview

#Preview("Notification", as: .content, using: SampleActivityAttributes.preview) {
    SampleLiveActivity()
} contentStates: {
    SampleActivityAttributes.ContentState.smiley
    SampleActivityAttributes.ContentState.starEyes
}
