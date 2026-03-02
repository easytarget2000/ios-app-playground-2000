@MainActor protocol MenuViewModel {

    var navigateToCounterTitle: String { get }
    var navigateToLegacyCounterTitle: String { get }
    var navigateToNotificationPlaygroundTitle: String { get }
    var navigateToRBEditorTitle: String { get }

    func navigateToCounter()
    func navigateToLegacyCounter()
    func navigateToNotificationPlayground()
    func navigateToRBEditor()

}
