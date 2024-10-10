import SwiftUI

struct ContentInteractorKey: EnvironmentKey {
    static let defaultValue: any ContentInteractor = DefaultContentInteractor()
}

struct RouterKey: EnvironmentKey {
    static let defaultValue: any Router = DefaultRouter()
}
