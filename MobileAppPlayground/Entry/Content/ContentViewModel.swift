import Foundation
import Observation

// MARK: - Protocol

protocol ContentViewModel {
    var content: String? { get }
    var addContentButtonTitle: String { get }
    var navigateButtonTitle: String { get }
    var showLoadingIndicator: Bool { get }
    @MainActor func onAppear()
    @MainActor func onAddContentSelected()
    @MainActor func onNavigateSelected()
}

// MARK: - Default Implementation

@Observable final class DefaultContentViewModel: ContentViewModel {
    let router: any Router
    let interactor: any ContentInteractor
    
    var content: String?
    let addContentButtonTitle: String = "Add Content"
    let navigateButtonTitle: String = "Navigate"
    var showLoadingIndicator: Bool = false
            
    init(router: any Router, interactor: any ContentInteractor) {
        self.router = router
        self.interactor = interactor
        NSLog("DefaultContentViewModel initialized.")
    }
    
    deinit {
        NSLog("DefaultContentViewModel deinitialized.")
    }
    
    func onAppear() {
        Task {
            self.showLoadingIndicator = true
            self.setContent(from: try await self.interactor.fetchContent())
            self.showLoadingIndicator = false
        }
    }
    
    func onAddContentSelected() {
        Task {
            self.showLoadingIndicator = true
            self.setContent(from: try await self.interactor.addContent())
            self.showLoadingIndicator = false
        }
    }
    
    private func setContent(from int: Int) {
        self.content = .init(int)
    }
    
    func onNavigateSelected() {
        router.navigate(to: .content2)
    }
}

// MARK: - Preview Implementation

final class PreviewContentViewModel: ContentViewModel {
    let content: String? = "Lorem ipsum. (Preview)"
    let addContentButtonTitle: String = "Perform something (Preview)"
    let navigateButtonTitle: String = "Navigate (Preview)"
    var showLoadingIndicator: Bool = true
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onAppear() {}
    func onAddContentSelected() {}
    func onNavigateSelected() {}
}
