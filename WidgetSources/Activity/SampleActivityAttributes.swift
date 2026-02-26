import ActivityKit

struct SampleActivityAttributes: ActivityAttributes {

    // MARK: - Dynamic, Stateful Properties

    public struct ContentState: Codable, Hashable {

        var emoji: String

        var progress: Double

    }

    // MARK: - Fixed Properties

    var name: String

}

#warning("TODO: Exclude Live Activity sample data from release builds.")

// MARK: - Preview Samples

extension SampleActivityAttributes {

    static var preview: Self {
        .init(name: "World")
    }

}

extension SampleActivityAttributes.ContentState {

    static var smiley: Self {
        .init(emoji: "😀", progress: 2 / 3)
    }

    static var starEyes: Self {
        .init(emoji: "🤩", progress: 1 / 3)
    }

}
