import ActivityKit
import Observation

@Observable
final class DefaultNotificationPlaygroundViewModel: NotificationPlaygroundViewModel {

    // MARK: - Properties

    // MARK: External

    var permission: NotificationPermission = .unknown

    // MARK: Internal

    private let router: any Router
    private let permissionInteractor: any NotificationPermissionInteractor
    private let lifecycleLogger: any Logger
    private let activityLogger: any Logger

    private var activity: Activity<SampleActivityAttributes>?

    // MARK: - Lifecycle

    init(
        router: any Router,
        permissionInteractor: any NotificationPermissionInteractor,
        lifecycleLogger: some Logger,
        activityLogger: some Logger,
    ) {
        self.router = router
        self.permissionInteractor = permissionInteractor
        self.lifecycleLogger = lifecycleLogger
        self.activityLogger = activityLogger

        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
    }

    // MARK: - Interaction

    func setup() async {
        await self.updatePermission()
    }

    func requestPermission() async {
#warning("TODO: Handle errors thrown when querying for notification permissions.")
        try? await self.permissionInteractor.requestPermission()
        await self.updatePermission()

        if self.permission == .denied {
            self.router.open(externalItem: .appSettings)
        }
    }

    func startLiveActivity() async {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            return
        }

        if let activity = self.activity {
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

            self.activityLogger.debug("Updating activity with state: \(newState)")

            Task {
                await activity.update(newContent, alertConfiguration: alertConfiguration)
            }
        } else {
            do {
                self.activity = try .request(
                    attributes: .init(name: "aaa"),
                    content: .init(state: .smiley, staleDate: .init(timeIntervalSinceNow: 10)),
                    pushType: .token,
                )
                self.activityLogger.debug("Requested Activity.")
            } catch {
                self.activity = nil
                self.activityLogger.error(error)
            }
        }
    }

    // MARK: Implementations

    private func updatePermission() async {
        self.permission = await self.permissionInteractor.getPermission()
    }

}

// MARK: - Convenience Initializer

extension NotificationPlaygroundViewModel
where Self == DefaultNotificationPlaygroundViewModel {

    static func `default`(
        router: any Router,
        permissionInteractor: any NotificationPermissionInteractor = .osShared,
        lifecycleLogger: some Logger = .lifecycle(subsystem: .notification),
        activityLogger: some Logger = .activity(subsystem: .notification),
    ) -> Self {
        .init(
            router: router,
            permissionInteractor: permissionInteractor,
            lifecycleLogger: lifecycleLogger,
            activityLogger: activityLogger,
        )
    }

}
