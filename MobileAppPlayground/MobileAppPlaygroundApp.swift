import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    
    private let contentInteractor: DefaultContentInteractor = .init()
    
    var body: some Scene {
        WindowGroup {
            RoutingView()
//                .environmentObject(contentInteractor)
        }
    }
}

struct RouterKey: EnvironmentKey {
    static let defaultValue: any Router = DefaultRouter()
}

extension EnvironmentValues {
    var router: any Router {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
}
