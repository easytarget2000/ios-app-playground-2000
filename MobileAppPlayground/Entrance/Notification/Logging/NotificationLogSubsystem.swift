struct NotificationLogSubsystem: LogSubsystem {

    let suffix: String = "notification"

}

extension LogSubsystem where Self == NotificationLogSubsystem {

    static var notification: Self {
        Self.init()
    }

}
