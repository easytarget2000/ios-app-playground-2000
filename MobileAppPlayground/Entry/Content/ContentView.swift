import SwiftUI

// MARK: - Injector

struct ContentViewInjector: View {
    @Environment(\.router) private var router: any Router
    @Environment(\.contentInteractor) private var contentInteractor: any ContentInteractor
    
    var body: some View {
        ContentView(
            viewModel: DefaultContentViewModel(
                router: router,
                interactor: contentInteractor
            )
        )
    }
}

// MARK: - View

struct ContentView: View {
    @State var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            if viewModel.showLoadingIndicator {
                ProgressView()
            }
            Text(viewModel.content ?? "")
            Button(viewModel.performanceButtonTitle) {
                viewModel.onPerformanceButtonPress()
            }
            Button(viewModel.navigationButtonTitle) {
                viewModel.onNavigationButtonPress()
            }
        }
        .padding()
        .task {
            viewModel.onAppear()
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView(viewModel: PreviewContentViewModel())
}
