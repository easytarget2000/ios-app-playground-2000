final class PreviewCounterViewModel: CounterViewModel {
    
    var shouldShowLoadingIndicator: Bool
    let currentValue: String?
    let addCounterButtonTitle: String = "Perform something (Preview)"
    let navigateButtonTitle: String = "Navigate (Preview)"
    
    init(
        shouldShowLoadingIndicator: Bool = true,
        counter: String? = "Lorem ipsum. (Preview)"
    ) {
        self.shouldShowLoadingIndicator = shouldShowLoadingIndicator
        self.currentValue = counter
    }
    
    func onAppear() {}
    func onAddCounterSelected() {}
    func onNavigateSelected() {}
    
}

extension CounterViewModel where Self == PreviewCounterViewModel {
    static var preview: Self {
        .init()
    }
}
