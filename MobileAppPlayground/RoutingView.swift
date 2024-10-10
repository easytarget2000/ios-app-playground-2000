//
//  RoutingView.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-10.
//

import SwiftUI

struct RoutingView: View {
    
    @State private var navigationPath: [NavigationItem] = [.home]
    
    init() {
        NSLog("RouteView initialized.")
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            EmptyView()
                .navigationDestination(
                    for: NavigationItem.self,
                    destination: viewDestination
                )
        }
    }
    
    private func viewDestination(for navigationItem: NavigationItem) -> some View {
        switch navigationItem {
        case .home:
            ContentView(viewModel: DefaultContentViewModel(interactor: DefaultContentInteractor()))
        }
    }
}

#Preview {
    RoutingView()
}


enum NavigationItem: Hashable {
    case home
}
