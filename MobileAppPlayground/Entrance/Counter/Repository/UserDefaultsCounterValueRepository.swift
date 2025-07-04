import Foundation

final actor UserDefaultsCounterValueRepository: CounterValueRepository {

    // MARK: - Properties

    static let shared: UserDefaultsCounterValueRepository = .init(
        userDefaults: .standard,
        lifecycleLogger: .lifecycle(subsystem: .counter)
    )

    var simulateSlowResponse = true

    private let userDefaults: UserDefaults
    private let lifecycleLogger: Logger

    // MARK: - Constructor/Deconstructor

    init(
        userDefaults: UserDefaults,
        lifecycleLogger: any Logger
    ) {
        self.userDefaults = userDefaults
        self.lifecycleLogger = lifecycleLogger

        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
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

extension CounterValueRepository where Self == UserDefaultsCounterValueRepository {

    static var sharedUserDefaults: Self {
        Self.shared
    }

}
