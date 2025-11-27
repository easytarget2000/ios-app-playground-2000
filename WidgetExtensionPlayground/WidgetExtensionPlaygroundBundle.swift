//
//  WidgetExtensionPlaygroundBundle.swift
//  WidgetExtensionPlayground
//
//  Created by Michel Sievers  on 2025-11-27.
//

import WidgetKit
import SwiftUI

@main
struct WidgetExtensionPlaygroundBundle: WidgetBundle {
    var body: some Widget {
        WidgetExtensionPlayground()
        WidgetExtensionPlaygroundControl()
        WidgetExtensionPlaygroundLiveActivity()
    }
}
