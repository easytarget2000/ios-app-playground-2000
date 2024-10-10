final class PreviewContentViewModel: ContentViewModel {
    var shouldShowLoadingIndicator: Bool
    let content: String?
    let addContentButtonTitle: String = "Perform something (Preview)"
    let navigateButtonTitle: String = "Navigate (Preview)"
    
    init(
        shouldShowLoadingIndicator: Bool = true,
        content: String? = "Lorem ipsum. (Preview)"
    ) {
        self.shouldShowLoadingIndicator = shouldShowLoadingIndicator
        self.content = content
    }
    
    func onAppear() {}
    func onAddContentSelected() {}
    func onNavigateSelected() {}
}
