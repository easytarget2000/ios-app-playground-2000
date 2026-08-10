import Observation

protocol NestingViewModel3 {

    var value: Int { get }

    func increaseValue()

}

extension NestingViewModel3 where Self == DefaultNestingViewModel3 {

    static func `default`() -> Self {
        Self.init(
            lifecycleLogger: .default(subsystem: .nesting, category: .lifecycle)
        )
    }

}

@Observable
final class DefaultNestingViewModel3: NestingViewModel3 {

    private(set) var value: Int = 0

    private let lifecycleLogger: any Logger

    init(lifecycleLogger: some Logger) {
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultNestingViewModel3: init() +++")
    }

    deinit {
        self.lifecycleLogger.debug("DefaultNestingViewModel3: deinit() ---")
    }

    func increaseValue() {
        value += 1
    }
}
