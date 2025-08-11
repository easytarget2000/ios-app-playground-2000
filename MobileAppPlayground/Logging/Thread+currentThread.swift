import Foundation

extension Thread {
    /// A convenience method to print out the current thread from an async method.
    /// This is a workaround for compiler error:
    /// Class property 'current' is unavailable from asynchronous contexts;
    /// Thread.current cannot be used from async contexts.
    /// See:
    /// https://github.com/swiftlang/swift-corelibs-foundation/issues/5139
    /// https://www.avanderlee.com/concurrency/swift-6-2-concurrency-changes/
    nonisolated static var currentThread: Thread {
        return Thread.current
    }
}
