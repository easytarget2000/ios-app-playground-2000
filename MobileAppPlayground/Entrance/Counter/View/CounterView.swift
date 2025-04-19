import SwiftUI

struct CounterView: View {

    let viewModel: CounterViewModel

    var body: some View {
        VStack {
            if self.viewModel.shouldShowLoadingIndicator {
                ProgressView()
            }

            Text(self.viewModel.currentLocalValue ?? "")
            Button(self.viewModel.addToLocalCounterButtonTitle) {
                Task {
                    try? await self.viewModel.onAddToLocalCounterSelected()
                }
            }

            Text(self.viewModel.currentGlobalValue ?? "")
            Button(self.viewModel.addToGlobalCounterButtonTitle) {
                Task {
                    try? await self.viewModel.onAddToGlobalCounterSelected()
                }
            }

            Button(self.viewModel.navigateToAnotherCounterTitle) {
                self.viewModel.navigateToAnotherCounter()
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
