import Foundation

final class UserDefaultsCounterValueRepository: CounterValueRepository {

    // MARK: - Properties

    @MainActor static let shared: UserDefaultsCounterValueRepository = .init(
        lifecycleLogger: .lifecycle(subsystem: .counter),
        threadingLogger: .threading(subsystem: .counter),
    )

    let simulateSlowResponse = true

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

    @concurrent func fetchValue() async throws -> Int {
        self.threadingLogger.debug(
            "fetchValue() started on thread: \(Thread.currentThread)"
            + "; task: \(String(describing: Task.name))"
        )
        if self.simulateSlowResponse {
            try await Task.sleep(for: .seconds(0.5))
        }

        self.threadingLogger.debug(
            "fetchValue() returned to thread: \(Thread.currentThread)"
            + "; task: \(String(describing: Task.name))"
        )
        return self.userDefaults.integer(forKey: UserDefaultsKey.counterValue)
    }

    @concurrent func setValue(_ value: Int) async throws {
        self.threadingLogger.debug(
            "setValue() started on thread: \(Thread.currentThread)"
            + "; task: \(String(describing: Task.name))"
        )
        self.userDefaults.set(value, forKey: UserDefaultsKey.counterValue)
        self.threadingLogger.debug(
            "setValue() returned to thread: \(Thread.currentThread)"
            + "; task: \(String(describing: Task.name))"
        )
    }

}

extension CounterValueRepository where Self == UserDefaultsCounterValueRepository {

    @MainActor static var sharedUserDefaults: Self {
        Self.shared
    }

}
