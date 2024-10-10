import Foundation

// MARK: - Protocol

protocol ContentInteractor: Sendable {
    func loadContent(for currentContent: String) async throws -> String
}

// MARK: - Default Implementation

final actor DefaultContentInteractor: ContentInteractor {
    init () {
        NSLog("DefaultContentInteractor initialized.")
    }
    
    deinit {
        NSLog("DefaultContentInteractor deinitialized.")
    }
    
    func loadContent(for currentContent: String) async throws -> String {
        try await Task.sleep(for: .seconds(5))
        return currentContent + currentContent
    }
}

// MARK: - Preview Implementation

final class PreviewContentInteractor: ContentInteractor {
    func loadContent(for currentContent: String) async throws -> String {
        return currentContent + " (preview)"
    }
}
