import Foundation
import Observation

protocol ContentViewModel {
    var content: String { get }
    var performanceButtonTitle: String { get }
    var navigationButtonTitle: String { get }
    var showLoadingIndicator: Bool { get }
    @MainActor func onPerformanceButtonPress() async throws
    @MainActor func onNavigationButtonPress() async throws
}

final class PreviewContentViewModel: ContentViewModel {
    let content: String = "Lorem ipsum. (Preview)"
    let performanceButtonTitle: String = "Perform something (Preview)"
    let navigationButtonTitle: String = "Navigate (Preview)"
    var showLoadingIndicator: Bool = true
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onPerformanceButtonPress() async throws { }
    func onNavigationButtonPress() async throws { }
}

@Observable final class DefaultContentViewModel: ContentViewModel {
    let interactor: any ContentInteractor
    
    var content: String = "Lorem ipsum."
    let performanceButtonTitle: String = "Perform Something"
    let navigationButtonTitle: String = "Navigate"
    var showLoadingIndicator: Bool = false
            
    init(interactor: any ContentInteractor) {
        self.interactor = interactor
        NSLog("DefaultContentViewModel initialized.")
    }
    
    func onPerformanceButtonPress() async throws {
        showLoadingIndicator = true
        content = try await interactor.loadContent(for: content)
        showLoadingIndicator = false
    }
    
    func onNavigationButtonPress() async throws {
        
    }
}

final class ContentViewModelFactory {
    static func buildDefault(
        interactor: any ContentInteractor = ContentInteractorFactory.build()
    ) -> DefaultContentViewModel {
        .init(interactor: interactor)
    }
}
