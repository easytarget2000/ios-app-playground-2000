protocol NotificationPlaygroundViewModel {
    
    var permission: NotificationPermission { get }
    
    @MainActor func setup() async
    @MainActor func requestPermission() async throws
    
}
