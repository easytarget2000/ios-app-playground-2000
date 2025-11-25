final class PreviewNotificationPlaygroundViewModel:
    NotificationPlaygroundViewModel {

    let permission: NotificationPermission

    init(permission: NotificationPermission = .denied) {
        self.permission = permission
    }

    func setup() async {}
    func requestPermission() async throws {}
    func startLiveActivity() {}
}

extension NotificationPlaygroundViewModel
where Self == PreviewNotificationPlaygroundViewModel {

    static var preview: Self {
        .init()
    }

}
