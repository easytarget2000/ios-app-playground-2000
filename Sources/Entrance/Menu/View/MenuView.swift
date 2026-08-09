import SwiftUI

struct MenuView: View {

    let viewModel: any MenuViewModel

    @State private var showRBFileImporter: Bool = false

    var body: some View {
        VStack {
            Button(self.viewModel.navigateToCounterTitle) {
                self.viewModel.navigateToCounter()
            }
            Button(self.viewModel.navigateToLegacyCounterTitle) {
                self.viewModel.navigateToLegacyCounter()
            }
            Button(self.viewModel.navigateToNestingTitle) {
                self.viewModel.navigateToNesting()
            }
            Button(self.viewModel.navigateToNotificationPlaygroundTitle) {
                self.viewModel.navigateToNotificationPlayground()
            }
            Button(self.viewModel.navigateToRBEditorTitle) {
                //                self.viewModel.navigateToRBEditor()
                self.showRBFileImporter = true
            }
            .fileImporter(
                isPresented: self.$showRBFileImporter,
                allowedContentTypes: [.folder],
                onCompletion: { result in
                    switch result {
                    case .success(let directory):
                        // gain access to the directory
                        let gotAccess = directory.startAccessingSecurityScopedResource()
                        if !gotAccess { return }
                        // access the directory URL
                        // (read templates in the directory, make a bookmark, etc.)
//                        onTemplatesDirectoryPicked(directory)
                        print("DEBUG: \(directory)")
                        // release access
                        directory.stopAccessingSecurityScopedResource()
                    case .failure(let error):
                        // handle error
                        print(error)
                    }
                }
            )
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
