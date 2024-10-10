import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    
    private let contentInteractor: DefaultContentInteractor = DefaultContentInteractor()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: DefaultContentViewModel(interactor: contentInteractor))
        }
    }
}

