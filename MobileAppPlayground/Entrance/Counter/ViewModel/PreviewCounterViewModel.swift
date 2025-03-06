final class PreviewCounterViewModel: CounterViewModel {

    var shouldShowLoadingIndicator: Bool
    let currentLocalValue: String?
    let currentGlobalValue: String?
    let addToLocalCounterButtonTitle: String = "Perform something (Preview)"
    let addToGlobalCounterButtonTitle: String = "Perform something (Preview)"
    let navigateToAnotherCounterTitle: String
    = "Counter in Another View (Preview)"

    init(
        shouldShowLoadingIndicator: Bool = true,
        currentLocalValue: String? = "0",
        currentGlobalValue: String? = "0"
    ) {
        self.shouldShowLoadingIndicator = shouldShowLoadingIndicator
        self.currentLocalValue = currentLocalValue
        self.currentGlobalValue = currentGlobalValue
    }

    func setup() {}
    func onAddToLocalCounterSelected() {}
    func onAddToGlobalCounterSelected() {}
    func navigateToAnotherCounter() {}
}

extension CounterViewModel where Self == PreviewCounterViewModel {
    static var preview: Self {
        .init()
    }
}
