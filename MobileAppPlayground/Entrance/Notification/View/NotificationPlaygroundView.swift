import SwiftUI

// MARK: - Injector

struct NotificationPlaygroundViewInjector: View {
    @Environment(\.router) private var router: any Router
    @Environment(\.notificationPermissionInteractor)
    private var permissionInteractor: any NotificationPermissionInteractor
    
    var body: some View {
        NotificationPlaygroundView()
    }
}

// MARK: - View

struct NotificationPlaygroundView: View {
//    @State var viewModel: CounterViewModel
    
    var body: some View {
        EmptyView()
//        VStack {
//            if self.viewModel.shouldShowLoadingIndicator {
//                ProgressView()
//            }
//            Text(self.viewModel.currentValue ?? "")
//            Button(self.viewModel.addCounterButtonTitle) {
//                Task {
//                    try? await self.viewModel.onAddCounterSelected()
//                }
//            }
//            Button(viewModel.navigateButtonTitle) {
//                self.viewModel.onNavigateSelected()
//            }
//        }
//        .padding()
//        .task {
//            try? await self.viewModel.onAppear()
//        }
    }
}

// MARK: - Preview

#Preview {
    NotificationPlaygroundView()
}