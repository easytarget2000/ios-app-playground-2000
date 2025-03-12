final actor DefaultCounterInteractor: CounterInteractor {

    // MARK: - Properties

    private let globalValueRepository: any CounterValueRepository
    private let lifecycleLogger: Logger
    private var localValue: Int = 0

    // MARK: - Constructor/Deconstructor

    init(
        initialLocalValue: Int,
        globalValueRepository: any CounterValueRepository,
        lifecycleLogger: any Logger
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


extension CounterInteractor where Self == DefaultCounterInteractor {

    static func `default`(
        initialLocalValue: Int = 0,
        globalValueRepository: any CounterValueRepository = .sharedUserDefaults,
        lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Counter")
    ) -> Self {
        Self.init(
            initialLocalValue: initialLocalValue,
            globalValueRepository: globalValueRepository,
            lifecycleLogger: lifecycleLogger
        )
    }

}
