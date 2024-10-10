import Foundation
import Observation

@Observable final class DefaultContentViewModel: ContentViewModel {
    
    // MARK: - Properties
    
    private let router: any Router
    private let interactor: any ContentInteractor
    private let logger: any Logger
    
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
    
    // MARK: - Lifecycle
            
    init(router: any Router, interactor: any ContentInteractor, logger: some Logger = LifecycleLogger()) {
        self.router = router
        self.interactor = interactor
        self.logger = logger
        logger.debug("DefaultContentViewModel initialized.")
    }
    
    deinit {
        logger.debug("DefaultContentViewModel deinitialized.")
    }
    
    // MARK: - Interaction
    
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
    
    // MARK: Implementation
    
    private func setContent(from int: Int) {
        self.innerContent = .init(int)
    }
}
