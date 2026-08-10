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

    @State private var flag: Bool = false
    private let viewModel3: some NestingViewModel3 = .default()

    init() {
        logger.debug("NestingView2: init()")
    }

    var body: some View {
        let _ = logger.debug("NestingView2: body()")
        VStack(spacing: 8) {
            Text("nesting.level2.header")
            Button("nesting.level2.button") {
                self.flag = !self.flag
            }
            NestingView3(viewModel: viewModel3)
        }
        .background(flag ? .yellow : .orange)
    }
}

private struct NestingView3: View {

    @State private var simpleCounterValue = 0
    private let viewModel: any NestingViewModel3

    init(viewModel: some NestingViewModel3) {
        self.viewModel = viewModel
        logger.debug("NestingView3: init()")
    }

    var body: some View {
        let _ = logger.debug("NestingView3: body()")

        VStack(spacing: 8) {
            Text("nesting.level3.Header")
            Button("nesting.level3.simpleCounterButton") {
                self.simpleCounterValue += 1
            }
            Text(
                "nesting.level3.simpleCounterValue(\(self.simpleCounterValue))"
            )
            Button("nesting.level3.modelCounterButton") {
                self.viewModel.increaseValue()
            }
            Text(
                "nesting.level3.modelCounterValue(\(self.viewModel.value))"
            )
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
