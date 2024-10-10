protocol ContentViewModel {
    var shouldShowLoadingIndicator: Bool { get }
    
    var content: String? { get }
    
    var addContentButtonTitle: String { get }
    var navigateButtonTitle: String { get }

    @MainActor func onAppear()
    @MainActor func onAddContentSelected()
    @MainActor func onNavigateSelected()
}
