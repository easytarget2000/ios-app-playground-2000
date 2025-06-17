@MainActor
final class LegacyCounterViewModelPool {

    static let shared: LegacyCounterViewModelPool = .init()
    private var viewModels: [String: LegacyCounterViewModel] = [:]

    private init() {}

    func viewModel(
        contextID: String,
        router: Router,
        interactor: any CounterInteractor = .default(),
        lifecycleLogger: some Logger = .lifecycle(subsystem: .counter),
    ) -> LegacyCounterViewModel {
        if let viewModel = self.viewModels[contextID] {
            return viewModel
        }

        let viewModel: LegacyCounterViewModel = .init(
            router: router,
            interactor: interactor,
            lifecycleLogger: lifecycleLogger
        )

        self.viewModels[contextID] = viewModel
        return viewModel
    }

}
