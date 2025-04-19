final class PreviewMenuViewModel: MenuViewModel {

    let navigateToCounterTitle: String = "Counter (Preview)"
    let navigateToLegacyCounterTitle: String = "Legacy Counter (Preview)"
    let navigateToNotificationPlaygroundTitle: String
    = "Notifications Playground (Preview)"

    func navigateToCounter() {}
    func navigateToLegacyCounter() {}
    func navigateToNotificationPlayground() {}
}

extension MenuViewModel where Self == PreviewMenuViewModel {
    static var preview: Self {
        .init()
    }
}
