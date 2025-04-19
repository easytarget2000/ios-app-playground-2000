import SwiftUI

struct LegacyCounterView: View {

    @StateObject private var viewModel: LegacyCounterViewModel

    init(viewModel: LegacyCounterViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            progressSection
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

// MARK: - Convenience Initializer

extension CounterViewModel where Self == LegacyCounterViewModel {

    static func legacy(
        router: any Router,
        interactor: any CounterInteractor = .default(),
        lifecycleLogger: some Logger = .lifecycle(subsystem: .counter)
    ) -> Self {
        .init(
            router: router,
            interactor: interactor,
            lifecycleLogger: lifecycleLogger
        )
    }

}
