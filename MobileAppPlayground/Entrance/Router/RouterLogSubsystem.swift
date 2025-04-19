struct RouterLogSubsystem: LogSubsystem {

    let suffix: String = "router"

}

extension LogSubsystem where Self == RouterLogSubsystem {

    static var router: Self {
        Self.init()
    }

}
