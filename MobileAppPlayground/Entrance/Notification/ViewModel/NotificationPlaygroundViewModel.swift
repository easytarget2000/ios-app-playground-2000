protocol NotificationPlaygroundViewModel {

    var permission: NotificationPermission { get }

    func setup() async
    func requestPermission() async throws

}
