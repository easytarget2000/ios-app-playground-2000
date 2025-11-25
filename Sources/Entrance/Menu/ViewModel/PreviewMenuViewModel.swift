final class PreviewMenuViewModel: MenuViewModel {

    let navigateToCounterTitle: String = .init(
        localized: .Menu.counterItem
    )
    let navigateToLegacyCounterTitle: String = .init(
        localized: .Menu.legacyCounterItem
    )
    let navigateToNotificationPlaygroundTitle: String = .init(
        localized: .Menu.notificationPlaygroundItem
    )

    func navigateToCounter() {}
    func navigateToLegacyCounter() {}
    func navigateToNotificationPlayground() {}
}

extension MenuViewModel where Self == PreviewMenuViewModel {
    static var preview: Self {
        .init()
    }
}
