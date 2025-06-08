import Foundation
import Observation

@Observable final class DefaultCounterViewModel: CounterViewModel {

    // MARK: - Properties

    private let router: any Router
    private let interactor: any CounterInteractor
    private let lifecycleLogger: any Logger

    var currentLocalValue: String? {
        self.shouldShowCounter ? self.innerLocalCounter : nil
    }

    var currentGlobalValue: String? {
        self.shouldShowCounter ? self.innerGlobalCounter : nil
    }

    let addToLocalCounterButtonTitle: String = .init(
        localized: .Counter.addToLocalCounterButton
    )
    let addToGlobalCounterButtonTitle: String = .init(
        localized: .Counter.addToGlobalCounterButton
    )
    let navigateToAnotherCounterTitle: String = .init(
        localized: .Counter.navigateToAnotherCounterButton
    )

    var shouldShowLoadingIndicator: Bool = false

    private var shouldShowCounter: Bool {
        !self.shouldShowLoadingIndicator
    }

    private var innerLocalCounter: String?
    private var innerGlobalCounter: String?

    // MARK: - Lifecycle

    init(
        router: any Router,
        interactor: any CounterInteractor,
        lifecycleLogger: some Logger
    ) {
        self.router = router
        self.interactor = interactor
        self.lifecycleLogger = lifecycleLogger

        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
    }

    // MARK: - Interaction

    func setup() async throws {
        self.shouldShowLoadingIndicator = true
        self.setLocalCounter(from: try await self.interactor.fetchLocal())
        self.setGlobalCounter(from: try await self.interactor.fetchGlobal())
        self.shouldShowLoadingIndicator = false
    }

    func onAddToLocalCounterSelected() async throws {
        self.shouldShowLoadingIndicator = true
        self.setLocalCounter(from: try await self.interactor.incrementLocal())
        self.shouldShowLoadingIndicator = false
    }

    func onAddToGlobalCounterSelected() async throws {
        self.shouldShowLoadingIndicator = true
        self.setGlobalCounter(from: try await self.interactor.incrementGlobal())
        self.shouldShowLoadingIndicator = false
    }

    func navigateToAnotherCounter() {
        self.router.navigate(to: .counter)
    }

    // MARK: Implementation

    private func setLocalCounter(from int: Int) {
        self.innerLocalCounter = .init(int)
    }

    private func setGlobalCounter(from int: Int) {
        self.innerGlobalCounter = .init(int)
    }
}

// MARK: - Convenience Initializer

extension CounterViewModel where Self == DefaultCounterViewModel {

    static func `default`(
        router: any Router,
        interactor: any CounterInteractor = .default(),
        lifecycleLogger: some Logger = .lifecycle(subsystem: .counter)
    ) -> Self {
        .init(
            router: router,
            interactor: interactor,
            lifecycleLogger: lifecycleLogger
        )
    }

}
