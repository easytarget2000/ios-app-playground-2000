final class PreviewMenuViewModel: MenuViewModel {

    let navigateToCounterTitle: String = "Counter (Preview)"
    let navigateToNotificationPlaygroundTitle: String
    = "Notifications Playground (Preview)"

    func navigateToCounter() {}
    func navigateToNotificationPlayground() {}
}

extension MenuViewModel where Self == PreviewMenuViewModel {
    static var preview: Self {
        .init()
    }
}
