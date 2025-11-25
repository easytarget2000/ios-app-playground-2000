import Foundation
import os

// MARK: - Protocol

protocol Logger: Sendable {
    nonisolated func debug(_ message: String)
}

// MARK: - Default Implementation

final class DefaultLogger: Logger {

    private enum Constant {
        static let subsystem: String = Bundle.main.bundleIdentifier!
    }

    private let osLogger: os.Logger

    init(subsystem: some LogSubsystem, category: some LogCategory) {
        let completeSubsystem: String
        = "\(Constant.subsystem).\(subsystem.suffix)"

        self.osLogger = .init(
            subsystem: completeSubsystem,
            category: category.name
        )
    }

    nonisolated func debug(_ message: String) {
        self.osLogger.debug("DEBUG: \(message)")
    }

}

extension Logger where Self == DefaultLogger {

    static func `default`(
        subsystem: some LogSubsystem,
        category: some LogCategory,
    ) -> Self {
        Self.init(subsystem: subsystem, category: category)
    }

}

// MARK: - No-Op Implementation

final class NoOpLogger: Logger {

    nonisolated func debug(_ message: String) {}

}

extension Logger where Self == NoOpLogger {

    static var noOp: Self {
        Self.init()
    }

}
