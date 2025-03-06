protocol CounterViewModel {

    var shouldShowLoadingIndicator: Bool { get }

    var currentLocalValue: String? { get }
    var currentGlobalValue: String? { get }

    var addToLocalCounterButtonTitle: String { get }
    var addToGlobalCounterButtonTitle: String { get }
    var navigateToAnotherCounterTitle: String { get }

    @MainActor func setup() async throws
    @MainActor func onAddToLocalCounterSelected() async throws
    @MainActor func onAddToGlobalCounterSelected() async throws
    @MainActor func navigateToAnotherCounter()

}
