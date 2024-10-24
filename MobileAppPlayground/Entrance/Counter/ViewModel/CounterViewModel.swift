protocol CounterViewModel {
    var shouldShowLoadingIndicator: Bool { get }
    
    var counter: String? { get }
    
    var addCounterButtonTitle: String { get }
    var navigateButtonTitle: String { get }

    @MainActor func onAppear()
    @MainActor func onAddCounterSelected()
    @MainActor func onNavigateSelected()
}
