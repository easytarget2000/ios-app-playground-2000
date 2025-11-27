import SwiftUI
import WidgetKit

@main
struct WidgetExtensionPlaygroundBundle: WidgetBundle {
    var body: some Widget {
        WidgetExtensionPlayground()
        WidgetExtensionPlaygroundControl()
        WidgetExtensionPlaygroundLiveActivity()
    }
}
