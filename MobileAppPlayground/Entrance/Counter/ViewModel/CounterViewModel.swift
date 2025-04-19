import Observation

protocol CounterViewModel {

    var shouldShowLoadingIndicator: Bool { get }

    var currentValue: String? { get }

    var addCounterButtonTitle: String { get }
    var navigateToAnotherCounterTitle: String { get }

    @MainActor func setup() async throws
    @MainActor func onAddCounterSelected() async throws
    @MainActor func navigateToAnotherCounter()

}
