import SwiftUI

// swiftlint:disable redundant_discardable_let

private let logger: some Logger = .default(
    subsystem: .nesting,
    category: .lifecycle,
)

struct TopNestingView: View {

    init() {
        logger.debug("TopNestingView: init()")
    }

    var body: some View {
        let _ = logger.debug("TopNestingView: body()")
        NestingView2()
    }
}

private struct NestingView2: View {

    init() {
        logger.debug("NestingView2: init()")
    }

    var body: some View {
        let _ = logger.debug("NestingView2: body()")
        VStack(spacing: 8) {
            Text("nesting.level2Header")
            NestingView3()
        }
        .background(.yellow)
    }
}

private struct NestingView3: View {

    @State private var simpleCounterValue = 0
    @State private var viewModel: any NestingViewModel3

    init() {
        self.viewModel = DefaultNestingViewModel3()
        logger.debug("NestingView3: init()")
    }

    var body: some View {
        let _ = logger.debug("NestingView3: body()")

        VStack(spacing: 8) {
            Text("nesting.level3Header")
            Button("nesting.simpleCounterButton") {
                self.simpleCounterValue += 1
            }
            Text("nesting.simpleCounterValueLabel")
            Text("\(simpleCounterValue)")
            Text("nesting.modelCounterValueLabel")
            Text("\(simpleCounterValue)")
        }
        .background(.orange)
    }
}

// swiftlint:enable redundant_discardable_let

// MARK: - Preview

#if DEBUG

#Preview {
    TopNestingView()
}

#endif
