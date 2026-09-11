#if DEBUG

final class PreviewMenuViewModel: MenuViewModel {

    let navigateToCounterTitle: String = .init(
        localized: .menuCounterItem
    )
    let navigateToLegacyCounterTitle: String = .init(
        localized: .menuLegacyCounterItem
    )
    let navigateToNestingTitle: String = .init(
        localized: .menuNestingItem
    )
    let navigateToNotificationPlaygroundTitle: String = .init(
        localized: .menuNotificationPlaygroundItem
    )
    let navigateToRBEditorTitle: String = .init(
        localized: .menuRbEditorItem
    )

    func navigateToCounter() {}
    func navigateToLegacyCounter() {}
    func navigateToNotificationPlayground() {}
    func navigateToNesting() {}
    func navigateToRBEditor() {}
}

extension MenuViewModel where Self == PreviewMenuViewModel {
    static var preview: Self {
        .init()
    }
}

#endif
