import Foundation
import Observation

// MARK: - Protocol

protocol ContentViewModel {
    var content: String? { get }
    var performanceButtonTitle: String { get }
    var navigationButtonTitle: String { get }
    var showLoadingIndicator: Bool { get }
    @MainActor func onAppear()
    @MainActor func onPerformanceButtonPress()
    @MainActor func onNavigationButtonPress()
}

// MARK: - Default Implementation

@Observable final class DefaultContentViewModel: ContentViewModel {
    let router: any Router
    let interactor: any ContentInteractor
    
    var content: String?
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
    
    func onAppear() {
        Task {
            self.showLoadingIndicator = true
            self.setContent(from: try await interactor.fetchContent())
            self.showLoadingIndicator = false
        }
    }
    
    func onPerformanceButtonPress() {
        Task {
            self.showLoadingIndicator = true
            self.setContent(from: try await interactor.addContent())
            self.showLoadingIndicator = false
        }
    }
    
    private func setContent(from int: Int) {
        self.content = .init(int)
    }
    
    func onNavigationButtonPress() {
        router.navigate(to: .content2)
    }
}

// MARK: - Preview Implementation

final class PreviewContentViewModel: ContentViewModel {
    let content: String? = "Lorem ipsum. (Preview)"
    let performanceButtonTitle: String = "Perform something (Preview)"
    let navigationButtonTitle: String = "Navigate (Preview)"
    var showLoadingIndicator: Bool = true
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onAppear() {}
    func onPerformanceButtonPress() {}
    func onNavigationButtonPress() {}
}
