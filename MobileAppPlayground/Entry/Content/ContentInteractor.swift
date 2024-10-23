import Foundation

// MARK: - Protocol

protocol ContentInteractor: Sendable {
    func fetchContent() async throws -> Int
    func addContent() async throws -> Int
}

// MARK: - Preview Implementation

final class PreviewContentInteractor: ContentInteractor {
    func fetchContent() async throws -> Int {
        0
    }
    
    func addContent() async throws -> Int {
        1
    }
}
