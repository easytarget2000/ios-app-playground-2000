import SwiftUI

// MARK: - Injector

struct CounterViewInjector: View {
    @Environment(\.router) private var router: any Router
    @Environment(\.counterInteractor) private var counterInteractor: any CounterInteractor
    
    var body: some View {
        CounterView(
            viewModel: .default(
                router: self.router,
                interactor: self.counterInteractor
            )
        )
    }
}

// MARK: - View

struct CounterView: View {
    @State var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            if self.viewModel.shouldShowLoadingIndicator {
                ProgressView()
            }
            Text(self.viewModel.currentValue ?? "")
            Button(self.viewModel.addCounterButtonTitle) {
                Task {
                    try? await self.viewModel.onAddCounterSelected()
                }
            }
            Button(self.viewModel.navigateToAnotherCounterTitle) {
                self.viewModel.navigateToAnotherCounter()
            }
            Button(self.viewModel.navigateToNotificationPlaygroundTitle) {
                self.viewModel.navigateToNotificationPlayground()
            }
        }
        .padding()
        .task {
            try? await self.viewModel.setup()
        }
    }
}

// MARK: - Preview

#Preview {
    CounterView(viewModel: .preview)
}
