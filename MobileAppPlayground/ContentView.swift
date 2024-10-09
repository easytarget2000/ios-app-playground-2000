//
//  ContentView.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.copy)
            Button(viewModel.buttonTitle) {
                viewModel.onButtonPress()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: PreviewContentViewModel())
}

protocol ContentViewModel {
    var copy: String { get }
    var buttonTitle: String { get }
    func onButtonPress()
}

@Observable final class PreviewContentViewModel: ContentViewModel {
    let copy: String = "Lorem ipsum. (Preview)"
    let buttonTitle: String = "Perform something. (Preview)"
    
    func onButtonPress() {
        // No-op
    }
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
}
