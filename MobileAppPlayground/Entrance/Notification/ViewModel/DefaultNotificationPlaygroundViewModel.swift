import Observation

@Observable final class DefaultNotificationPlaygroundViewModel:
    NotificationPlaygroundViewModel {

    // MARK: - Properties

    // MARK: External

    var permission: NotificationPermission = .unknown

    // MARK: Internal

    private let router: any Router
    private let permissionInteractor: any NotificationPermissionInteractor
    private let lifecycleLogger: any Logger

    // MARK: - Lifecycle

    init(
        router: any Router,
        permissionInteractor: any NotificationPermissionInteractor,
        lifecycleLogger: some Logger = .lifecycle(subsystemSuffix: "Counter")
    ) {
        self.router = router
        self.permissionInteractor = permissionInteractor
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultNotificationPlaygroundViewModel initialized.")
    }

    deinit {
        self.lifecycleLogger.debug("DefaultNotificationPlaygroundViewModel deinitialized.")
    }

    // MARK: - Interaction

    func setup() async {
        await self.updatePermission()
    }

    func requestPermission() async throws {
        try await self.permissionInteractor.requestPermission()
        await self.updatePermission()

        if self.permission == .denied {
            self.router.open(externalItem: .appSettings)
        }
    }

    @MainActor private func updatePermission() async {
        self.permission = await self.permissionInteractor.getPermission()
    }

}

// MARK: - Convenience Initializer

extension NotificationPlaygroundViewModel
where Self == DefaultNotificationPlaygroundViewModel {

    static func `default`(
        router: any Router,
        permissionInteractor: any NotificationPermissionInteractor,
        lifecycleLogger: some Logger = .lifecycle(subsystemSuffix: "Counter")
    ) -> Self {
        .init(
            router: router,
            permissionInteractor: permissionInteractor,
            lifecycleLogger: lifecycleLogger
        )
    }

}
