final actor DefaultCounterInteractor: CounterInteractor {

    // MARK: - Properties

    static let shared: DefaultCounterInteractor = .init(
        globalValueRepository: UserDefaultsCounterValueRepository()
    )

    private let globalValueRepository: any CounterValueRepository
    private let lifecycleLogger: Logger
    private var localValue: Int = 0

    // MARK: - Constructor/Deconstructor

    init(
        initialLocalValue: Int = 0,
        globalValueRepository: any CounterValueRepository,
        lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Counter")
    ) {
        self.localValue = initialLocalValue
        self.globalValueRepository = globalValueRepository
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultCounterInteractor initialized.")
    }

    deinit {
        self.lifecycleLogger.debug("DefaultCounterInteractor deinitialized.")
    }

    // MARK: - Protocol Implementations

    func fetchLocal() async throws -> Int {
        self.localValue
    }

    func fetchGlobal() async throws -> Int {
        try await self.globalValueRepository.fetchValue()
    }

    func incrementLocal() async throws -> Int {
        self.localValue += 1
        return self.localValue
    }

    func incrementGlobal() async throws -> Int {
        let newValue = try await self.fetchGlobal() + 1
        try await self.globalValueRepository.setValue(newValue)
        return newValue
    }

}
