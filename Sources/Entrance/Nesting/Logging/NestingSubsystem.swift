struct NestingSubsystem: LogSubsystem {

    let suffix: String = "nesting"

}

extension LogSubsystem where Self == NestingSubsystem {

    static var nesting: Self {
        Self.init()
    }

}
