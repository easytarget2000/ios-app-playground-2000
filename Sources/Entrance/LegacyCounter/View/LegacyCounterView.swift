import SwiftUI

struct LegacyCounterView: View {

    @ObservedObject var viewModel: LegacyCounterViewModel

    var body: some View {
        VStack {
            self.progressSection
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

    @ViewBuilder
    private var progressSection: some View {
        if self.viewModel.shouldShowLoadingIndicator {
            ProgressView()
        } else {
            EmptyView()
        }
    }
}
