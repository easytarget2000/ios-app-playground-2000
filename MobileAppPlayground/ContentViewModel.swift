import Foundation
import Observation

protocol ContentViewModel {
    var copy: String { get }
    var buttonTitle: String { get }
    @MainActor func onButtonPress() async throws
}

final class PreviewContentViewModel: ContentViewModel {
    let copy: String = "Lorem ipsum. (Preview)"
    let buttonTitle: String = "Perform something. (Preview)"
    
    init() {
        NSLog("PreviewContentViewModel initialized.")
    }
    
    func onButtonPress() async throws { }
}

@Observable final class DefaultContentViewModel: ContentViewModel {
    var copy: String = "Lorem ipsum."
    let buttonTitle: String = "Perform something."
            
    init() {
        NSLog("DefaultContentViewModel initialized.")
    }
    
    func onButtonPress() async throws {
        copy += copy
    }
}
