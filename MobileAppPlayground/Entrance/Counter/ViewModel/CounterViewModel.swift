protocol CounterViewModel {
    var shouldShowLoadingIndicator: Bool { get }
    
    var currentValue: String? { get }
    
    var addCounterButtonTitle: String { get }
    var navigateButtonTitle: String { get }

    @MainActor func onAppear() async throws
    @MainActor func onAddCounterSelected() async throws
    @MainActor func onNavigateSelected()
}
