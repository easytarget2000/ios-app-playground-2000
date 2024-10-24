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
    
    func fetchValue() async throws -> Int {
        try await self.valueRepository.fetchValue()
    }
    
    func increaseValue() async throws -> Int {
        let newValue = try await self.fetchValue()
        try await self.valueRepository.setValue(newValue)
        return newValue
    }
}
