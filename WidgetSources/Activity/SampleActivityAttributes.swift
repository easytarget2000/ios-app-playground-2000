import ActivityKit

struct SampleActivityAttributes: ActivityAttributes {

    // MARK: - Dynamic, Stateful Properties

    public struct ContentState: Codable, Hashable {
        var emoji: String
    }

    // MARK: - Fixed Properties
    var name: String

}

// MARK: - Preview Samples

extension SampleActivityAttributes {

    static var preview: Self {
        .init(name: "World")
    }

}

extension SampleActivityAttributes.ContentState {

    static var smiley: Self {
        .init(emoji: "😀")
    }

    static var starEyes: Self {
        .init(emoji: "🤩")
    }

}
