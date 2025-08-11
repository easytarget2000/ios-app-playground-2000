struct ThreadingLogCategory: LogCategory {
    let name: String = "threading"
}

extension LogCategory where Self == ThreadingLogCategory {

    static var threading: Self {
        Self.init()
    }

}

extension Logger where Self == DefaultLogger {

    static func threading(subsystem: some LogSubsystem) -> Self {
        Self.init(subsystem: subsystem, category: .threading)
    }

}
