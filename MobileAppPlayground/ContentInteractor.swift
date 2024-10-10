import Foundation

protocol ContentInteractor: Sendable {
    func loadContent(for currentContent: String) async throws -> String
}

final class PreviewContentInteractor: ContentInteractor {
    func loadContent(for currentContent: String) async throws -> String {
        return currentContent + " (preview)"
    }
}

final actor DefaultContentInteractor: ContentInteractor {
    init () {
        NSLog("DefaultContentInteractor initialized.")
    }
    
    func loadContent(for currentContent: String) async throws -> String {
        try await Task.sleep(for: .seconds(5))
        return currentContent + currentContent
    }
}

final class ContentInteractorFactory {
    static func build() -> DefaultContentInteractor {
        .init()
    }
}
