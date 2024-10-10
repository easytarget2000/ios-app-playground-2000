import SwiftUI

struct WrappedContentView: View {
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

struct ContentView: View {
    @State var viewModel: ContentViewModel
    
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

//final class ContentViewFactory {
//    @MainActor static func build(
//        viewModel: any ContentViewModel = ContentViewModelFactory.buildDefault()
//    ) -> ContentView {
//        .init(viewModel: viewModel)
//    }
//    
//    @MainActor static func build(
//        router: any Router,
//        interactor: any ContentInteractor
//    ) -> ContentView {
//        .init(
//            viewModel: ContentViewModelFactory.buildDefault(
//                router: router,
//                interactor: interactor
//            )
//        )
//    }
//}
