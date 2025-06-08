import Foundation
import os

// MARK: - Protocol

protocol Logger: Sendable {
    func debug(_ message: String)
}

// MARK: - Default Implementation

final class DefaultLogger: Logger {

    private enum Constant {
        static let subsystem: String = Bundle.main.bundleIdentifier!
    }

    private let osLogger: os.Logger

    init(subsystem: LogSubsystem, category: LogCategory) {
        let completeSubsystem: String = "\(Constant.subsystem).\(subsystem.suffix)"
        self.osLogger = .init(subsystem: completeSubsystem, category: category.name)
    }

    func debug(_ message: String) {
        self.osLogger.debug("DEBUG: \(message)")
    }

}

extension Logger where Self == DefaultLogger {

    static func `default`(subsystem: LogSubsystem, category: LogCategory) -> Self {
        Self.init(subsystem: subsystem, category: category)
    }

}

// MARK: - No-Op Implementation

final class NoOpLogger: Logger {

    func debug(_ message: String) {}

}

extension Logger where Self == NoOpLogger {

    static var noOp: Self {
        Self.init()
    }

}
