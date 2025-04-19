protocol MenuViewModel {

    var navigateToCounterTitle: String { get }
    var navigateToLegacyCounterTitle: String { get }
    var navigateToNotificationPlaygroundTitle: String { get }

    @MainActor func navigateToCounter()
    @MainActor func navigateToLegacyCounter()
    @MainActor func navigateToNotificationPlayground()

}
