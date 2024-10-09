import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: DefaultContentViewModel())
        }
    }
}
