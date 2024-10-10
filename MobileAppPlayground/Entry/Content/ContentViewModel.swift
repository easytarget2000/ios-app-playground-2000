import Foundation
import Observation

// MARK: - Protocol

protocol ContentViewModel {
    var content: String { get }
    var performanceButtonTitle: String { get }
    var navigationButtonTitle: String { get }
    var showLoadingIndicator: Bool { get }
    @MainActor func onPerformanceButtonPress()
    @MainActor func onNavigationButtonPress()
}

// MARK: - Default Implementation

@Observable final class DefaultContentViewModel: ContentViewModel {
    let router: any Router
    let interactor: any ContentInteractor
    
    var content: String = "Lorem ipsum."
    let performanceButtonTitle: String = "Perform Something"
    let navigationButtonTitle: String = "Navigate"
    var showLoadingIndicator: Bool = false
            
    init(router: any Router, interactor: any ContentInteractor) {
        self.router = router
        self.interactor = interactor
        NSLog("DefaultContentViewModel initialized.")
    }
    
    deinit {
        NSLog("DefaultContentViewModel deinitialized.")
    }
    
    func onPerformanceButtonPress() {
        Task {
            showLoadingIndicator = true
            content = try await interactor.loadContent(for: content)
            showLoadingIndicator = false
        }
    }
    
    func onNavigationButtonPress() {
        router.navigate(to: .content2)
    }
}

// MARK: - Preview Implementation

final class PreviewContentViewModel: ContentViewModel {
    let content: String = "Lorem ipsum. (Preview)"
    let performanceButtonTitle: String = "Perform something (Preview)"
    let navigationButtonTitle: String = "Navigate (Preview)"
    var showLoadingIndicator: Bool = true
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onPerformanceButtonPress() {}
    func onNavigationButtonPress() {}
}
