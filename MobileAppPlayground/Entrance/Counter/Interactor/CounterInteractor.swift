import Foundation

// MARK: - Protocol

protocol CounterInteractor: Sendable {
    func fetch() async throws -> Int
    func increment() async throws -> Int
}

// MARK: - Preview Implementation

final actor PreviewCounterInteractor: CounterInteractor {
    private var value = 0
    
    func fetch() async throws -> Int {
        self.value
    }
    
    func increment() async throws -> Int {
        self.value += 1
        return self.value
    }
}
