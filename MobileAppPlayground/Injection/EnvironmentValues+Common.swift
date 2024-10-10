import SwiftUI

extension EnvironmentValues {
    var contentInteractor: any ContentInteractor {
        get { self[ContentInteractorKey.self] }
        set { self[ContentInteractorKey.self] = newValue }
    }
    
    var router: any Router {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
}
