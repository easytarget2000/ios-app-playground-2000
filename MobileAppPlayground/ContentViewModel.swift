import Foundation
import Observation

protocol ContentViewModel {
    var content: String { get }
    var buttonTitle: String { get }
    var showLoadingIndicator: Bool { get }
    @MainActor func onButtonPress() async throws
}

@Observable final class DefaultContentViewModel: ContentViewModel {
    let interactor: any ContentInteractor
    
    var content: String = "Lorem ipsum."
    let buttonTitle: String = "Perform Something"
    
    var showLoadingIndicator: Bool = false
            
    init(interactor: any ContentInteractor) {
        self.interactor = interactor
        NSLog("DefaultContentViewModel initialized.")
    }
    
    func onButtonPress() async throws {
        showLoadingIndicator = true
        try await interactor.loadContent(for: content)
        showLoadingIndicator = false
    }
}



final class PreviewContentViewModel: ContentViewModel {
    let content: String = "Lorem ipsum. (Preview)"
    let buttonTitle: String = "Perform something. (Preview)"
    var showLoadingIndicator: Bool = true
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onButtonPress() async throws { }
}
