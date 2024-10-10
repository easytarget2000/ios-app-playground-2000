import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    
    private let router: some Router = DefaultRouter()
    private let contentInteractor: some ContentInteractor = DefaultContentInteractor()
    
    var body: some Scene {
        WindowGroup {
            RoutingView(router: router, contentInteractor: contentInteractor)
        }
    }
}

