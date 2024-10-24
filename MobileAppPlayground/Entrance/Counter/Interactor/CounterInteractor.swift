import Foundation

// MARK: - Protocol

protocol CounterInteractor: Sendable {
    func fetchValue() async throws -> Int
    func increaseValue() async throws -> Int
}

// MARK: - Preview Implementation

final actor PreviewCounterInteractor: CounterInteractor {
    private var value = 0
    
    func fetchValue() async throws -> Int {
        value
    }
    
    func increaseValue() async throws -> Int {
        value += 1
        return value
    }
}
