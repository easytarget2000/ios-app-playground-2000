import Foundation

// MARK: - Protocol

protocol CounterInteractor: ObservableObject, Sendable {
    func fetchLocal() async throws -> Int
    func fetchGlobal() async throws -> Int
    func incrementLocal() async throws -> Int
    func incrementGlobal() async throws -> Int
}

// MARK: - Preview Implementation

final actor PreviewCounterInteractor: CounterInteractor {
    private var localValue = 0
    private var globalValue = 0

    private var maybe: Int!

    func fetchLocal() async throws -> Int {
        self.localValue
    }

    func fetchGlobal() async throws -> Int {
        self.globalValue
    }

    func incrementLocal() async throws -> Int {
        self.localValue += 1
        return self.localValue
    }

    func incrementGlobal() async throws -> Int {
        self.globalValue += 1
        return self.globalValue
    }
}

// MARK: Convenience Initalizer

extension CounterInteractor where Self == PreviewCounterInteractor {
    static var preview: Self {
        .init()
    }
}
