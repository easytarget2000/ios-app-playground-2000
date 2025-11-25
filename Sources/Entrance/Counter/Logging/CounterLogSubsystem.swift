struct CounterLogSubsystem: LogSubsystem {

    let suffix: String = "counter"

}

extension LogSubsystem where Self == CounterLogSubsystem {

    static var counter: Self {
        Self.init()
    }

}
