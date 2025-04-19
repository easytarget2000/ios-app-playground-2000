struct LifecycleLogCategory: LogCategory {
    let name: String = "lifecycle"
}

extension LogCategory where Self == LifecycleLogCategory {

    static var lifecycle: Self {
        Self.init()
    }

}

extension Logger where Self == DefaultLogger {

    static func lifecycle(subsystem: LogSubsystem) -> Self {
        Self.init(subsystem: subsystem, category: .lifecycle)
    }

}
