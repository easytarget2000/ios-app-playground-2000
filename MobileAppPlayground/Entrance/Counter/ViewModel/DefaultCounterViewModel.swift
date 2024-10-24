import Foundation
import Observation

@Observable final class DefaultCounterViewModel: CounterViewModel {
    
    // MARK: - Properties
    
    private let router: any Router
    private let interactor: any CounterInteractor
    private let lifecycleLogger: any Logger
    
    var counter: String? {
        return if self.shouldShowCounter {
            self.innerCounter
        } else {
            nil
        }
    }
    
    let addCounterButtonTitle: String = "Add Counter"
    let navigateButtonTitle: String = "Navigate"
    var shouldShowLoadingIndicator: Bool = false
    
    private var shouldShowCounter: Bool {
        !self.shouldShowLoadingIndicator
    }
    
    private var innerCounter: String?
    
    // MARK: - Lifecycle
            
    init(
        router: any Router,
        interactor: any CounterInteractor,
        lifecycleLogger: some Logger = .lifecycle(subsystemSuffix: "Counter")
    ) {
        self.router = router
        self.interactor = interactor
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultCounterViewModel initialized.")
    }
    
    deinit {
        self.lifecycleLogger.debug("DefaultCounterViewModel deinitialized.")
    }
    
    // MARK: - Interaction
    
    func onAppear() {
        Task {
            self.shouldShowLoadingIndicator = true
            self.setCounter(from: try await self.interactor.fetch())
            self.shouldShowLoadingIndicator = false
        }
    }
    
    func onAddCounterSelected() {
        Task {
            self.shouldShowLoadingIndicator = true
            self.setCounter(from: try await self.interactor.increment())
            self.shouldShowLoadingIndicator = false
        }
    }
    
    func onNavigateSelected() {
        self.router.navigate(to: .counter2)
    }
    
    // MARK: Implementation
    
    private func setCounter(from int: Int) {
        self.innerCounter = .init(int)
    }
}
