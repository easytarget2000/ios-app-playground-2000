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
                Task {
                    try await viewModel.onButtonPress()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: PreviewContentViewModel())
}
