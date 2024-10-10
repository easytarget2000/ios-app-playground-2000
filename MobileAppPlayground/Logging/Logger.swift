import Foundation
import os

// MARK: - Protocol

protocol Logger: Sendable {
    func debug(_ message: String)
}

fileprivate let subsystem: String = Bundle.main.bundleIdentifier!

// MARK: - Lifecycle Logger

final class LifecycleLogger: Logger {
    private let osLogger: os.Logger = .init(subsystem: subsystem, category: "Lifecycle")
    
    func debug(_ message: String) {
        osLogger.debug("\(message)")
    }
}

// MARK: - No-Op Implementation

final class NoOpLogger: Logger {
    func debug(_ message: String) {}
}
