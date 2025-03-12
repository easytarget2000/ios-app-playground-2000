import SwiftUI

struct MenuView: View {

    @State private var viewModel: any MenuViewModel = .default(router: .sharedDefault)

    var body: some View {
        VStack {
            Button(self.viewModel.navigateToCounterTitle) {
                self.viewModel.navigateToCounter()
            }
            Button(self.viewModel.navigateToNotificationPlaygroundTitle) {
                self.viewModel.navigateToNotificationPlayground()
            }
        }
        .padding()
    }

}

// MARK: - Preview

#Preview {
    MenuView()
}
