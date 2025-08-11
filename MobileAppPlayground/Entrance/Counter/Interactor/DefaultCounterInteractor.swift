import Foundation

final actor DefaultCounterInteractor: CounterInteractor {

    // MARK: - Properties

    private let globalValueRepository: any CounterValueRepository
    private let lifecycleLogger: any Logger
    private let threadingLogger: any Logger
    private var localValue: Int = 0

    // MARK: - Constructor/Deconstructor

    init(
        initialLocalValue: Int,
        globalValueRepository: any CounterValueRepository,
        lifecycleLogger: some Logger,
        threadingLogger: some Logger,
    ) {
        self.localValue = initialLocalValue
        self.globalValueRepository = globalValueRepository
        self.lifecycleLogger = lifecycleLogger
        self.threadingLogger = threadingLogger

        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
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
        self.threadingLogger.debug(
            "incrementGlobal() started on thread: \(Thread.currentThread)"
        )

        let newValue = try await self.fetchGlobal() + 1
        try await self.globalValueRepository.setValue(newValue)

        self.threadingLogger.debug(
            "incrementGlobal() returned to thread: \(Thread.currentThread)"
        )
        return newValue
    }

}

extension CounterInteractor where Self == DefaultCounterInteractor {

    static func `default`(
        initialLocalValue: Int = 0,
        globalValueRepository: any CounterValueRepository = .sharedUserDefaults,
        lifecycleLogger: any Logger = .lifecycle(subsystem: .counter),
        threadingLogger: any Logger = .threading(subsystem: .counter),
    ) -> Self {
        Self.init(
            initialLocalValue: initialLocalValue,
            globalValueRepository: globalValueRepository,
            lifecycleLogger: lifecycleLogger,
            threadingLogger: threadingLogger,
        )
    }

}
