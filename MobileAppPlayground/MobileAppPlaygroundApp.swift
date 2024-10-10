import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    
    private let contentInteractor: DefaultContentInteractor = .init()
    
    var body: some Scene {
        WindowGroup {
            RoutingView()
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

struct ContentInteractorKey: EnvironmentKey {
    static let defaultValue: any ContentInteractor = DefaultContentInteractor()
}

extension EnvironmentValues {
    var contentInteractor: any ContentInteractor {
        get { self[ContentInteractorKey.self] }
        set { self[ContentInteractorKey.self] = newValue }
    }
}
