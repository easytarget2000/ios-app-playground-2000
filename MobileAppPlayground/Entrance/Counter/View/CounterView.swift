import SwiftUI

// MARK: - Injector

struct CounterViewInjector: View {
    @Environment(\.router) private var router: any Router
    @Environment(\.counterInteractor) private var counterInteractor: any CounterInteractor
    
    var body: some View {
        CounterView(
            viewModel: DefaultCounterViewModel(
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
            Button(viewModel.navigateButtonTitle) {
                self.viewModel.onNavigateSelected()
            }
        }
        .padding()
        .task {
            try? await self.viewModel.onAppear()
        }
    }
}

// MARK: - Preview

#Preview {
    CounterView(viewModel: .preview)
}
