//
//  RoutingView.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-10.
//

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
        case .content1:
            Color.red
        case .content2:
            Color.blue
        }
    }
}

#Preview {
    RoutingView()
        .environment(\.router, PreviewRouter())
}


enum NavigationItem: Hashable {
    case content1
    case content2
}
