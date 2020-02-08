import SwiftUI

struct NotificationView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(16)
            .transition(.move(edge: .top))
            .animation(.spring())
    }
}

struct ContentView: View {
    @State private var notificationShown = false

    var body: some View {
        VStack {
            if self.notificationShown {
                NotificationView {
                    Text("notification")
                }
            }

            Spacer()

            Button("toggle") {
                self.notificationShown.toggle()
            }

            Spacer()
        }
    }
}
