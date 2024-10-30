@testable import MobileAppPlayground

final actor FakeNotificationPermissionInteractor: NotificationPermissionInteractor {
    
    // MARK: - Properties
    
    // MARK: Return Values
    
    var getPermissionResult: NotificationPermission
    
    // MARK: - Spies
    
    var requestPermissionCalled: Bool = false
    
    // MARK: - Constructor
    
    init(getPermissionResult: NotificationPermission = .unknown) {
        self.getPermissionResult = getPermissionResult
    }
    
    // MARK: - Protocol Implementation
    
    func getPermission() async -> NotificationPermission {
        self.getPermissionResult
    }
    
    func requestPermission() async throws {
        self.requestPermissionCalled = true
    }
    
}
