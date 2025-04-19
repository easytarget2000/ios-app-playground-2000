import SwiftUI

struct LegacyCounterView: View {

    @StateObject var viewModel: LegacyCounterViewModel

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
        }
        .padding()
        .task {
            try? await self.viewModel.setup()
        }
    }

}
