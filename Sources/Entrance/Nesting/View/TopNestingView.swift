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

    init() {
        logger.debug("NestingView3: init()")
    }

    var body: some View {
        let _ = logger.debug("NestingView3: body()")
        Text("Nesting Level 3")
    }
}

// MARK: - Preview

#if DEBUG

#Preview {
    TopNestingView()
}

#endif
