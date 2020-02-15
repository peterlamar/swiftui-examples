import SwiftUI

struct ContentView: View {
    @State private var alarmTime = Date()

    func scheduleNotification(dateComponents: DateComponents) {
        let manager = LocalNotificationManager()
        manager.notifications = [
            Notification(id: "reminder-\(dateComponents)",
                         title: "Reminder \(dateComponents.hour!):\(dateComponents.minute!)",
                         message: "Do not forget something!",
                         datetime: dateComponents),
        ]

        manager.schedule()
    }

    var body: some View {
        VStack {
            DatePicker(selection: $alarmTime, in: Date()..., displayedComponents: .hourAndMinute) {
                Text("Select a time for alarm")
            }

            Button(action: {
                print("Alarm Created")

                let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self.alarmTime)
                self.scheduleNotification(dateComponents: dateComponents)

            }) {
                HStack {
                    Text("Create Alarm")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
