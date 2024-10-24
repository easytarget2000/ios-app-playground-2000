import SwiftUI

// MARK: - Injector

struct ContentViewInjector: View {
    @Environment(\.router) private var router: any Router
    @Environment(\.contentInteractor) private var contentInteractor: any CounterInteractor
    
    var body: some View {
        ContentView(
            viewModel: DefaultContentViewModel(
                router: self.router,
                interactor: self.contentInteractor
            )
        )
    }
}

// MARK: - View

struct ContentView: View {
    @State var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            if self.viewModel.shouldShowLoadingIndicator {
                ProgressView()
            }
            Text(self.viewModel.content ?? "")
            Button(self.viewModel.addContentButtonTitle) {
                self.viewModel.onAddContentSelected()
            }
            Button(viewModel.navigateButtonTitle) {
                self.viewModel.onNavigateSelected()
            }
        }
        .padding()
        .task {
            self.viewModel.onAppear()
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView(viewModel: .preview)
}
