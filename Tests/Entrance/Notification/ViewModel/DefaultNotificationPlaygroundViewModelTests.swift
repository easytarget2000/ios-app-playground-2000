@testable import MobileAppPlayground
import Testing

// swiftlint:disable:next type_name
@Suite struct DefaultNotificationPlaygroundViewModelTests {

    // MARK: - `requestPermission()`

    @Test func requestPermission_whenDenied_opensAppSettings() async throws {
        let spyRouter: FakeRouter = .init()
        let mockPermissionInteractor: FakeNotificationPermissionInteractor
        = .init(getPermissionResult: .denied)

        let sut: DefaultNotificationPlaygroundViewModel = .init(
            router: spyRouter,
            permissionInteractor: mockPermissionInteractor,
            lifecycleLogger: .noOp
        )

        try await sut.requestPermission()

        #expect(await spyRouter.openExternalItem == .appSettings)
    }

}
