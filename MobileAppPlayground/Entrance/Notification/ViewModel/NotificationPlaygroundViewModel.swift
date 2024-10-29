protocol NotificationPlaygroundViewModel {
    
    var permission: NotificationPermission { get }
    
    @MainActor func onAppear() async throws
    
}
