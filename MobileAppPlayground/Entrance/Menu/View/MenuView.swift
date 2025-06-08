import SwiftUI

struct MenuView: View {

    @State private var viewModel: any MenuViewModel

    init(viewModel: some MenuViewModel = .default(router: .sharedDefault)) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Button(self.viewModel.navigateToCounterTitle) {
                self.viewModel.navigateToCounter()
            }
            Button(self.viewModel.navigateToLegacyCounterTitle) {
                self.viewModel.navigateToLegacyCounter()
            }
            Button(self.viewModel.navigateToNotificationPlaygroundTitle) {
                self.viewModel.navigateToNotificationPlayground()
            }
        }
        .padding()
    }

}

// MARK: - Preview
#if DEBUG

#Preview {
    MenuView(viewModel: .preview)
}

#endif
