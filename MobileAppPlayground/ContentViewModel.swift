import Foundation
import Observation

protocol ContentViewModel {
    var copy: String { get }
    var buttonTitle: String { get }
    var showLoadingIndicator: Bool { get }
    @MainActor func onButtonPress() async throws
}

final class PreviewContentViewModel: ContentViewModel {
    let copy: String = "Lorem ipsum. (Preview)"
    let buttonTitle: String = "Perform something. (Preview)"
    var showLoadingIndicator: Bool = true
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onButtonPress() async throws { }
}

@Observable final class DefaultContentViewModel: ContentViewModel {
    
    let interactor: any ContentInteractor
    
    var copy: String = "Lorem ipsum."
    let buttonTitle: String = "Perform something."
    
    var showLoadingIndicator: Bool = false
            
    init(interactor: any ContentInteractor) {
        self.interactor = interactor
        NSLog("DefaultContentViewModel initialized.")
    }
    
    func onButtonPress() async throws {
        showLoadingIndicator = true
        
        Task { [weak self] in   // ???
            guard let self else { return }
            copy = try await interactor.loadContent(for: copy)
            showLoadingIndicator = false
        }
    }
}


