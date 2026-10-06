import SwiftUI

struct DuoView: View {

    var body: some View {
        if #available(iOS 27.1, *) {
            ArrangementView {
                firstView
            } secondary: {
                secondView
            }
            .arrangementViewStyle(.split)
        } else {
            ViewThatFits {
                HStack {
                    firstView
                    secondView
                }

                VStack {
                    firstView
                    secondView
                }
            }
        }
    }

    private var firstView: some View {
        Color.red
    }

    private var secondView: some View {
        Color.blue
    }
}

#if DEBUG

#Preview {
    DuoView()
}

#endif
