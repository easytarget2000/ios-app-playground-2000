import Testing
@testable import MobileAppPlayground

@Suite struct DefaultNotificationPlaygroundViewModelTests {
    
    // MARK: - `requestPermission()`
    
    @Test func requestPermission_whenDenied_opensAppSettings() async throws {
        let spyRouter: FakeRouter = .init()
        let mockPermissionInteractor: FakeNotificationPermissionInteractor
        = .init(getPermissionResult: .denied)
            
        let sut: DefaultNotificationPlaygroundViewModel = .init(
            router: spyRouter,
            permissionInteractor: mockPermissionInteractor
        )
        
        try await sut.requestPermission()
        
        #expect(await spyRouter.openExternalItem == .appSettings)
    }
    
}

