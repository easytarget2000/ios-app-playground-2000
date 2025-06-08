final class PreviewMenuViewModel: MenuViewModel {

    let navigateToCounterTitle: String = .init(
        localized: .counterItem
    )
    let navigateToLegacyCounterTitle: String = .init(
        localized: .legacyCounterItem
    )
    let navigateToNotificationPlaygroundTitle: String = .init(
        localized: .notificationPlaygroundItem
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
