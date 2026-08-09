import SwiftUI

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
        NestingView3()
    }
}

private struct NestingView3: View {

    @State private var count = 0

    init() {
        logger.debug("NestingView3: init()")
    }

    var body: some View {
        let _ = logger.debug("NestingView3: body()")

        VStack(spacing: 32) {
            Text("Nesting Level 3") // Continue here, move to ViewModel
            Button("Increase count") {
                self.count += 1
            }
            Text("Count: \(count)")
        }
    }
}

// MARK: - Preview

#if DEBUG

#Preview {
    TopNestingView()
}

#endif
