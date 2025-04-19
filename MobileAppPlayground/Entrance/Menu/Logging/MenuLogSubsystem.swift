struct MenuLogSubsystem: LogSubsystem {

    let suffix: String = "menu"

}

extension LogSubsystem where Self == MenuLogSubsystem {

    static var menu: Self {
        Self.init()
    }

}
