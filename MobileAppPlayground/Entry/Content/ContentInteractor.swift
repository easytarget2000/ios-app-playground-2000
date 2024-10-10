import Foundation

// MARK: - Protocol

protocol ContentInteractor: Sendable {
    func fetchContent() async throws -> Int
    func addContent() async throws -> Int
}

// MARK: - Default Implementation

final actor DefaultContentInteractor: ContentInteractor {
    private let lifecycleLogger: Logger
    private var currentContent: Int = 0
    
    init(lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Content")) {
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultContentInteractor initialized.")
    }
    
    deinit {
        self.lifecycleLogger.debug("DefaultContentInteractor deinitialized.")
    }
    
    func fetchContent() async throws -> Int {
        try await Task.sleep(for: .seconds(2))
        return self.currentContent
    }
    
    func addContent() async throws -> Int {
        let newContent = self.currentContent + 1
        defer { self.currentContent = newContent }
        
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
