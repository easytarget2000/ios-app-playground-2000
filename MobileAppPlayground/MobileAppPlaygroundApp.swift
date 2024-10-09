//
//  MobileAppPlaygroundApp.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-09.
//

import SwiftUI

@main
struct MobileAppPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PreviewContentViewModel())
        }
    }
}
