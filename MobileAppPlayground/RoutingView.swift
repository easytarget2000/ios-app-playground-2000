//
//  RoutingView.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-10.
//

import SwiftUI

struct RoutingView: View {
    
    @State private var router: any Router
    private let contentInteractor: any ContentInteractor
    
    init(router: some Router, contentInteractor: some ContentInteractor) {
        self.router = router
        self.contentInteractor = contentInteractor
        NSLog("RoutingView initialized.")
    }
    
    var body: some View {
        NavigationStack(path: router.navigationPath) {
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
            ContentViewFactory.build(router: router, interactor: contentInteractor)
        }
    }
}

#Preview {
    RoutingView(
        router: PreviewRouter(),
        contentInteractor: PreviewContentInteractor()
    )
}


enum NavigationItem: Hashable {
    case content
}
