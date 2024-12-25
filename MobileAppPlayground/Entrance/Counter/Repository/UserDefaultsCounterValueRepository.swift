import Foundation

final actor UserDefaultsCounterValueRepository: CounterValueRepository {

    // MARK: - Properties

    static let shared: UserDefaultsCounterValueRepository = .init()

    var simulateSlowResponse = false

    private let userDefaults: UserDefaults
    private let lifecycleLogger: Logger

    // MARK: - Constructor/Deconstructor

    init(
        userDefaults: UserDefaults = .standard,
        lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Counter")
    ) {
        self.userDefaults = userDefaults
        self.lifecycleLogger = lifecycleLogger

        self.lifecycleLogger.debug("UserDefaultsCounterValueRepository initialized.")
    }

    deinit {
        self.lifecycleLogger.debug("UserDefaultsCounterValueRepository deinitialized.")
    }

    // MARK: - Protocol Implementations

    func fetchValue() async throws -> Int {
        if self.simulateSlowResponse {
            try await Task.sleep(for: .seconds(0.5))
        }
        return self.userDefaults.integer(forKey: UserDefaultsKey.counterValue)
    }

    func setValue(_ value: Int) async throws {
        self.userDefaults.set(value, forKey: UserDefaultsKey.counterValue)
    }
}
