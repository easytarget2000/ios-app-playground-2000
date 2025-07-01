@MainActor final class CounterViewModelStorage {

    private static var instances: [Int: any CounterViewModel] = .init()

    static func instance(for id: Int) -> any CounterViewModel {
        if let existingInstance = self.instances[id] {
            return existingInstance
        }

        let newInstance: DefaultCounterViewModel = .init(
            router: .sharedDefault,
            interactor: .default(),
            lifecycleLogger: .lifecycle(subsystem: .counter),
        )

        self.instances[id] = newInstance
        return newInstance
    }

    static func clear() {
        self.instances = .init()
    }

}
