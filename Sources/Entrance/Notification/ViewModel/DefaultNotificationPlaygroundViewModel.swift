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
    private let liveActivityManager: LiveActivityManager

    // MARK: - Lifecycle

    init(
        router: any Router,
        permissionInteractor: any NotificationPermissionInteractor,
        lifecycleLogger: some Logger,
        liveActivityManager: LiveActivityManager,
    ) {
        self.router = router
        self.permissionInteractor = permissionInteractor
        self.lifecycleLogger = lifecycleLogger
        self.liveActivityManager = liveActivityManager

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
        await self.liveActivityManager.start()
    }

    func updateLiveActivity() async {
        await self.liveActivityManager.update()
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
            liveActivityManager: .init(logger: activityLogger),
        )
    }

}
