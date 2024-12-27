protocol MenuViewModel {

    var navigateToCounterTitle: String { get }
    var navigateToNotificationPlaygroundTitle: String { get }

    @MainActor func navigateToCounter()
    @MainActor func navigateToNotificationPlayground()

}
