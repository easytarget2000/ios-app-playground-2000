import Observation

@Observable final class DefaultNotificationPlaygroundViewModel: NotificationPlaygroundViewModel {
    
    // MARK: - Properties
    
    // MARK: External
    
    private(set) var permission: NotificationPermission = .unknown
    
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
            print("DEBUG: denied")
        }
    }
        
    private func updatePermission() async {
        self.permission = await self.permissionInteractor.getPermission()
    }
    
}
