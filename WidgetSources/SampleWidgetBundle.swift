import SwiftUI
import WidgetKit

@main
struct SampleWidgetBundle: WidgetBundle {
    
    var body: some Widget {
        let _ = print("DEBUG: WidgetBundle")
        SampleWidget()
        SampleControlWidget()
        SampleLiveActivity()
    }

}
