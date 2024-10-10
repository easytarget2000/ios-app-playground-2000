import SwiftUI

struct ContentView: View {
    
    @State private var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.showLoadingIndicator {
                ProgressView()
            }
            Text(viewModel.content)
            Button(viewModel.performanceButtonTitle) {
                Task {
                    try await viewModel.onPerformanceButtonPress()
                }
            }
            Button(viewModel.navigationButtonTitle) {
                Task {
                    try await viewModel.onNavigationButtonPress()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: PreviewContentViewModel())
}

final class ContentViewFactory {
    @MainActor static func build(
        viewModel: any ContentViewModel = ContentViewModelFactory.buildDefault()
    ) -> ContentView {
        .init(viewModel: viewModel)
    }
    
    @MainActor static func build(interactor: any ContentInteractor) -> ContentView {
        .init(viewModel: ContentViewModelFactory.buildDefault(interactor: interactor))
    }
}
