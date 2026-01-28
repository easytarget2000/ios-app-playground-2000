import SwiftUI

struct CounterView: View {

    let viewModel: any CounterViewModel

    var body: some View {
        VStack {
            if self.viewModel.shouldShowLoadingIndicator {
                ProgressView()
            }

            if let currentLocalValue = self.viewModel.currentLocalValue {
                Text(currentLocalValue)
            } else {
                EmptyView()
            }

            Button(self.viewModel.addToLocalCounterButtonTitle) {
                Task {
                    try? await self.viewModel.onAddToLocalCounterSelected()
                }
            }

            if let currentGlobalValue = self.viewModel.currentGlobalValue {
                Text(currentGlobalValue)
            } else {
                EmptyView()
            }

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
#if DEBUG

#Preview {
    CounterView(viewModel: .preview)
}

#endif
