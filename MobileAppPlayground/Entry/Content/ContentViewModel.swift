import Foundation
import Observation

// MARK: - Protocol

protocol ContentViewModel {
    var shouldShowLoadingIndicator: Bool { get }
    
    var content: String? { get }
    
    var addContentButtonTitle: String { get }
    var navigateButtonTitle: String { get }

    @MainActor func onAppear()
    @MainActor func onAddContentSelected()
    @MainActor func onNavigateSelected()
}

// MARK: - Default Implementation

@Observable final class DefaultContentViewModel: ContentViewModel {
    
    // MARK: Properties
    
    let router: any Router
    let interactor: any ContentInteractor
    
    var content: String? {
        return if shouldShowContent {
            self.innerContent
        } else {
            nil
        }
    }
    
    let addContentButtonTitle: String = "Add Content"
    let navigateButtonTitle: String = "Navigate"
    var shouldShowLoadingIndicator: Bool = false
    
    private var shouldShowContent: Bool {
        !shouldShowLoadingIndicator
    }
    
    private var innerContent: String?
    
    // MARK: Lifecycle
            
    init(router: any Router, interactor: any ContentInteractor) {
        self.router = router
        self.interactor = interactor
        NSLog("DefaultContentViewModel initialized.")
    }
    
    deinit {
        NSLog("DefaultContentViewModel deinitialized.")
    }
    
    // MARK: Interaction
    
    func onAppear() {
        Task {
            self.shouldShowLoadingIndicator = true
            self.setContent(from: try await self.interactor.fetchContent())
            self.shouldShowLoadingIndicator = false
        }
    }
    
    func onAddContentSelected() {
        Task {
            self.shouldShowLoadingIndicator = true
            self.setContent(from: try await self.interactor.addContent())
            self.shouldShowLoadingIndicator = false
        }
    }
    
    func onNavigateSelected() {
        router.navigate(to: .content2)
    }
    
    private func setContent(from int: Int) {
        self.innerContent = .init(int)
    }
}

// MARK: - Preview Implementation

final class PreviewContentViewModel: ContentViewModel {
    var shouldShowLoadingIndicator: Bool
    let content: String?
    let addContentButtonTitle: String = "Perform something (Preview)"
    let navigateButtonTitle: String = "Navigate (Preview)"

    
    init(
        shouldShowLoadingIndicator: Bool = true,
        content: String? = "Lorem ipsum. (Preview)"
    ) {
        self.shouldShowLoadingIndicator = shouldShowLoadingIndicator
        self.content = content
        
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onAppear() {}
    func onAddContentSelected() {}
    func onNavigateSelected() {}
}
