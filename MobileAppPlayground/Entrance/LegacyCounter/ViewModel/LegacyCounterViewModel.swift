import Foundation

final class LegacyCounterViewModel: CounterViewModel, ObservableObject {

    // MARK: - Properties

    private let router: any Router
    private let interactor: any CounterInteractor
    private let lifecycleLogger: any Logger

    let currentLocalValue: String? = nil

    var currentGlobalValue: String? {
        return if self.shouldShowCounter {
            self.innerCounter
        } else {
            nil
        }
    }

    let addToLocalCounterButtonTitle: String = "Add to Local Counter (disabled)"
    let addToGlobalCounterButtonTitle: String = "Add to Global Counter"
    let navigateToAnotherCounterTitle: String = "Counter in Another View"
    @Published private(set) var shouldShowLoadingIndicator: Bool = false

     private var shouldShowCounter: Bool {
        !self.shouldShowLoadingIndicator
    }

    @Published private var innerCounter: String?

    // MARK: - Lifecycle

    init(
        router: any Router,
        interactor: any CounterInteractor,
        lifecycleLogger: some Logger
    ) {
        self.router = router
        self.interactor = interactor
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("LegacyCounterViewModel initialized.")
    }

    deinit {
        self.lifecycleLogger.debug("LegacyCounterViewModel deinitialized.")
    }

    // MARK: - Interaction

    func setup() async throws {
        self.shouldShowLoadingIndicator = true
        self.setCounter(from: try await self.interactor.fetchGlobal())
        self.shouldShowLoadingIndicator = false
    }

    func onAddToLocalCounterSelected() async throws { }

    func onAddToGlobalCounterSelected() async throws {
        self.shouldShowLoadingIndicator = true
        self.setCounter(from: try await self.interactor.incrementGlobal())
        self.shouldShowLoadingIndicator = false
    }

    func navigateToAnotherCounter() {
        self.router.navigate(to: .legacyCounter)
    }

    // MARK: Implementation

    private func setCounter(from int: Int) {
        self.innerCounter = .init(int)
    }
}
