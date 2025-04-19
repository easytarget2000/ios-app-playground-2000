import SwiftUI

struct LegacyCounterView: View {

    @StateObject private var viewModel: LegacyCounterViewModel

    init(viewModel: LegacyCounterViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            progressSection
            Text(self.viewModel.currentValue ?? "")
            Button(self.viewModel.addCounterButtonTitle) {
                Task {
                    try? await self.viewModel.onAddCounterSelected()
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
