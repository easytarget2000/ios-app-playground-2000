import Foundation

final actor UserDefaultsCounterValueRepository: CounterValueRepository {

    // MARK: - Properties

    static let shared: UserDefaultsCounterValueRepository = .init(
        lifecycleLogger: .lifecycle(subsystem: .counter),
        threadingLogger: .threading(subsystem: .counter),
    )

    var simulateSlowResponse = true

    private let userDefaults: UserDefaults = .standard
    private let lifecycleLogger: any Logger
    private let threadingLogger: any Logger

    // MARK: - Constructor/Deconstructor

    init(lifecycleLogger: some Logger, threadingLogger: some Logger) {
        self.lifecycleLogger = lifecycleLogger
        self.threadingLogger = threadingLogger

        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
    }

    // MARK: - Protocol Implementations

    func fetchValue() async throws -> Int {
        self.threadingLogger.debug(
            "fetchValue() started on thread: \(Thread.currentThread)"
        )
        if self.simulateSlowResponse {
            try await Task.sleep(for: .seconds(0.5))
        }

        self.threadingLogger.debug(
            "fetchValue() returned to thread: \(Thread.currentThread)"
        )
        return self.userDefaults.integer(forKey: UserDefaultsKey.counterValue)
    }

    func setValue(_ value: Int) async throws {
        self.userDefaults.set(value, forKey: UserDefaultsKey.counterValue)
    }

}

extension CounterValueRepository where Self == UserDefaultsCounterValueRepository {

    static var sharedUserDefaults: Self {
        Self.shared
    }

}
