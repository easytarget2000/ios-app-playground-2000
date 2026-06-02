import ActivityKit

@MainActor
final class LiveActivityManager {

    // MARK: - Properties

    private let logger: any Logger

    private var activity: Activity<SampleActivityAttributes>?

    // MARK: - Lifecycle

    init(logger: some Logger) {
        self.logger = logger
    }

    // MARK: - Interaction

    func start() async {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            return
        }

        do {
            self.activity = try .request(
                attributes: .init(name: "Tokyo"),
                content: .init(state: .smiley, staleDate: nil),
                pushType: .token,
            )
            self.logger.debug("Requested Activity.")
        } catch {
            self.activity = nil
            self.logger.error(error)
        }

        if let activity {
            Task {
                for await pushToken in activity.pushTokenUpdates {
                    let pushTokenString = pushToken.reduce("") {
                        $0 + String(format: "%02x", $1)
                    }

                    self.logger.debug("New push token: \(pushTokenString)")
                }
            }
        }
    }

    func update() async {
        self.logger
            .debug("Activity is now: \(String(describing: self.activity?.activityState))")

        guard let activity else { return }
        let currentState = activity.content.state
        let newState: SampleActivityAttributes.ContentState = .init(
            emoji: currentState.emoji,
            progress: currentState.progress + 0.1
        )
        let newContent: ActivityContent<SampleActivityAttributes.ContentState> = .init(
            state: newState,
            staleDate: .init(timeIntervalSinceNow: 10),
        )
        let alertConfiguration: AlertConfiguration = .init(
            title: "Alert Title!",
            body: "Alert Body",
            sound: .default
        )

        self.logger.debug("Updating activity with state: \(newState)")

        await update(
            activity: activity,
            with: newContent,
            alertConfiguration: alertConfiguration
        )
    }

    // MARK: Implementations

    private func update(
        activity: sending Activity<SampleActivityAttributes>,
        with content: ActivityContent<SampleActivityAttributes.ContentState>,
        alertConfiguration: AlertConfiguration
    ) async {
        await activity.update(content, alertConfiguration: alertConfiguration)
    }

}
