final actor DefaultCounterInteractor: CounterInteractor {

    // MARK: - Properties

    static let shared: DefaultCounterInteractor = .init(
        valueRepository: UserDefaultsCounterValueRepository()
    )

    private let valueRepository: any CounterValueRepository
    private let lifecycleLogger: Logger

    // MARK: - Constructor/Deconstructor

    init(
        valueRepository: any CounterValueRepository,
        lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Counter")
    ) {
        self.valueRepository = valueRepository
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultCounterInteractor initialized.")
    }

    deinit {
        self.lifecycleLogger.debug("DefaultCounterInteractor deinitialized.")
    }

    // MARK: - Protocol Implementations

    func fetch() async throws -> Int {
        try await self.valueRepository.fetchValue()
    }

    func increment() async throws -> Int {
        let newValue = try await self.fetch() + 1
        try await self.valueRepository.setValue(newValue)
        return newValue
    }
    
}
