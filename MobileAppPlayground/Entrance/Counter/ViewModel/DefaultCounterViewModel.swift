import Foundation
import Observation

@Observable final class DefaultCounterViewModel: CounterViewModel {
    
    // MARK: - Properties
    
    private let router: any Router
    private let interactor: any CounterInteractor
    private let lifecycleLogger: any Logger
    
    var currentValue: String? {
        return if self.shouldShowCounter {
            self.innerCounter
        } else {
            nil
        }
    }
    
    let addCounterButtonTitle: String = "Add Counter"
    let navigateToAnotherCounterTitle: String = "Counter in Another View"
    let navigateToNotificationPlaygroundTitle: String = "Notifications Playground"
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
    
    func setup() async throws {
        self.shouldShowLoadingIndicator = true
        self.setCounter(from: try await self.interactor.fetch())
        self.shouldShowLoadingIndicator = false
    }
    
    func onAddCounterSelected() async throws {
        self.shouldShowLoadingIndicator = true
        self.setCounter(from: try await self.interactor.increment())
        self.shouldShowLoadingIndicator = false
    }
    
    func navigateToAnotherCounter() {
        self.router.navigate(to: .counter2)
    }
    
    func navigateToNotificationPlayground() {
        self.router.navigate(to: .notificationPlayground)
    }
    
    // MARK: Implementation
    
    private func setCounter(from int: Int) {
        self.innerCounter = .init(int)
    }
    
}
