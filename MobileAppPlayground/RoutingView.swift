//
//  RoutingView.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-10.
//

import SwiftUI

struct RoutingView: View {
    
    @State private var navigationPath: [NavigationItem] = [.content]
    
    private let contentInteractor: some ContentInteractor = DefaultContentInteractor()
    
    init() {
        NSLog("RoutingView initialized.")
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
        case .content:
            ContentViewFactory.build(interactor: contentInteractor)
        }
    }
}

#Preview {
    RoutingView()
}


enum NavigationItem: Hashable {
    case content
}
