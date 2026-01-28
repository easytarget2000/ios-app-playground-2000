@MainActor final class CounterViewModelStorage {

    private static var defaultInstances: [Int: DefaultCounterViewModel]
    = .init()
    private static var legacyInstances: [Int: LegacyCounterViewModel]
    = .init()

    static func defaultInstance(for id: Int) -> DefaultCounterViewModel {
        if let existingInstance = self.defaultInstances[id] {
            return existingInstance
        }

        let newInstance: DefaultCounterViewModel = .init(
            router: .sharedDefault,
            interactor: .default(),
            lifecycleLogger: .lifecycle(subsystem: .counter),
            threadingLogger: .threading(subsystem: .counter),
        )

        self.defaultInstances[id] = newInstance
        return newInstance
    }

    static func legacyInstance(for id: Int) -> LegacyCounterViewModel {
        if let existingInstance = self.legacyInstances[id] {
            return existingInstance
        }

        let newInstance: LegacyCounterViewModel = .init(
            router: .sharedDefault,
            interactor: .default(),
            lifecycleLogger: .lifecycle(subsystem: .counter),
        )

        self.legacyInstances[id] = newInstance
        return newInstance
    }

    static func clear() {
        self.defaultInstances = .init()
        self.legacyInstances = .init()
    }

}
