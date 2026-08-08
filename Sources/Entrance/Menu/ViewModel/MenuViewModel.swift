@MainActor protocol MenuViewModel {

    var navigateToCounterTitle: String { get }
    var navigateToLegacyCounterTitle: String { get }
    var navigateToNestingTitle: String { get }
    var navigateToNotificationPlaygroundTitle: String { get }
    var navigateToRBEditorTitle: String { get }

    func navigateToCounter()
    func navigateToLegacyCounter()
    func navigateToNesting()
    func navigateToNotificationPlayground()
    func navigateToRBEditor()

}
