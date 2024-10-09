import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    
    private let contentInteractor: any ContentInteractor = DefaultContentInteractor()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: DefaultContentViewModel(interactor: contentInteractor))
        }
    }
}
