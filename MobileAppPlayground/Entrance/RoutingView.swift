import SwiftUI

struct RoutingView: View {
    @Environment(\.router) private var router: any Router
    
    var body: some View {
        NavigationStack(path: router.navigationPath) {
            EmptyView()
                .navigationDestination(
                    for: NavigationItem.self,
                    destination: viewDestination
                )
        }
    }
    
    @ViewBuilder private func viewDestination(for navigationItem: NavigationItem) -> some View {
        switch navigationItem {
        case .counter1:
            CounterViewInjector()
        case .counter2:
            CounterViewInjector()
        }
    }
}

// MARK: - Preview

#Preview {
    RoutingView()
        .environment(\.router, .preview)
}
