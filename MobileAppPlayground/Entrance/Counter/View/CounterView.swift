import SwiftUI

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
