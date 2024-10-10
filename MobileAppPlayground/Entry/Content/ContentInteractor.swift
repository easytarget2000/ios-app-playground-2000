import Foundation

// MARK: - Protocol

protocol ContentInteractor: Sendable {
    func fetchContent() async throws -> Int
    func addContent() async throws -> Int
}

// MARK: - Default Implementation

final actor DefaultContentInteractor: ContentInteractor {
    private var currentContent: Int = 0
    
    init () {
        NSLog("DefaultContentInteractor initialized.")
    }
    
    deinit {
        NSLog("DefaultContentInteractor deinitialized.")
    }
    
    func fetchContent() async throws -> Int {
        try await Task.sleep(for: .seconds(2))
        return currentContent
    }
    
    func addContent() async throws -> Int {
        let newContent = currentContent + 1
        defer { currentContent = newContent }
        
        try await Task.sleep(for: .seconds(2))
        return newContent
    }
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
