#if DEBUG

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
    let navigateToRBEditorTitle: String = .init(
        localized: .menuRbEditorItem
    )

    func navigateToCounter() {}
    func navigateToLegacyCounter() {}
    func navigateToNotificationPlayground() {}
    func navigateToRBEditor() {}
}

extension MenuViewModel where Self == PreviewMenuViewModel {
    static var preview: Self {
        .init()
    }
}

#endif
