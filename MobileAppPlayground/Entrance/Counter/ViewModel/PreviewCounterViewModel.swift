final class PreviewCounterViewModel: CounterViewModel {
    
    var shouldShowLoadingIndicator: Bool
    let currentValue: String?
    let addCounterButtonTitle: String = "Perform something (Preview)"
    let navigateToAnotherCounterTitle: String = "Counter in Another View (Preview)"
    let navigateToNotificationPlaygroundTitle: String = "Notifications Playground (Preview)"
    
    init(
        shouldShowLoadingIndicator: Bool = true,
        counter: String? = "Lorem ipsum. (Preview)"
    ) {
        self.shouldShowLoadingIndicator = shouldShowLoadingIndicator
        self.currentValue = counter
    }
    
    func setup() {}
    func onAddCounterSelected() {}
    func navigateToAnotherCounter() {}
    func navigateToNotificationPlayground() {}
}

extension CounterViewModel where Self == PreviewCounterViewModel {
    static var preview: Self {
        .init()
    }
}
