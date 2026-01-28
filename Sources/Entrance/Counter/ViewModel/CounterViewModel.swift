@MainActor protocol CounterViewModel {

    var shouldShowLoadingIndicator: Bool { get }

    var currentLocalValue: String? { get }
    var currentGlobalValue: String? { get }

    var addToLocalCounterButtonTitle: String { get }
    var addToGlobalCounterButtonTitle: String { get }
    var navigateToAnotherCounterTitle: String { get }

    func setup() async throws
    func onAddToLocalCounterSelected() async throws
    func onAddToGlobalCounterSelected() async throws
    func navigateToAnotherCounter()

}
