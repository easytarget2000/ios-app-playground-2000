final class PreviewNotificationPlaygroundViewModel: NotificationPlaygroundViewModel {
    
    var permission: NotificationPermission = .unknown
    
    func onAppear() {}
    
}

extension NotificationPlaygroundViewModel where Self == PreviewNotificationPlaygroundViewModel {
    static var preview: Self {
        .init()
    }
}
