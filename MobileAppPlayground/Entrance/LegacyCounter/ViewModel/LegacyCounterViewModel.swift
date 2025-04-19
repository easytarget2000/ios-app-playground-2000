import Foundation

final class LegacyCounterViewModel: CounterViewModel, ObservableObject {

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
    var shouldShowLoadingIndicator: Bool = false

    private var shouldShowCounter: Bool {
        !self.shouldShowLoadingIndicator
    }

    private var innerCounter: String?

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
        self.setCounter(from: try await self.interactor.fetch())
        self.shouldShowLoadingIndicator = false
    }

    func onAddCounterSelected() async throws {
        self.shouldShowLoadingIndicator = true
        self.setCounter(from: try await self.interactor.increment())
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
