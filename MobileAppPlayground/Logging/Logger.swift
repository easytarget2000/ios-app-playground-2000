import Foundation
import os

// MARK: - Protocol

protocol Logger: Sendable {
    func debug(_ message: String)
}

fileprivate let subsystem: String = Bundle.main.bundleIdentifier!

// MARK: - Default Implementation

final class DefaultLogger: Logger {
    private let osLogger: os.Logger

    init(subsystemSuffix: String, category: String) {
        let completeSubsystem: String = "\(subsystem).\(subsystemSuffix)"
        self.osLogger = .init(subsystem: completeSubsystem, category: category)
    }

    func debug(_ message: String) {
        osLogger.debug("\(message)")
    }
}

extension Logger where Self == DefaultLogger {
    static func lifecycle(subsystemSuffix: String) -> DefaultLogger {
        .init(subsystemSuffix: subsystemSuffix, category: "lifecycle")
    }
}

// MARK: - No-Op Implementation

final class NoOpLogger: Logger {
    func debug(_ message: String) {}
}
