import Observation

protocol NestingViewModel3 {
    var value: Int { get }
    func increaseValue()
}

@Observable
final class DefaultNestingViewModel3: NestingViewModel3 {

    private(set) var value: Int = 0

    private let lifecycleLogger: any Logger

    init(lifecycleLogger: some Logger) {
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultNestingViewModel3: init()")
    }

    func increaseValue() {
        value += 1
    }
}
