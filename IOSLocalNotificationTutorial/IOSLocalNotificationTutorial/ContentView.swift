//
//  ContentView.swift
//  IOSLocalNotificationTutorial
//
//  Created by Peter Lamar on 1/19/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Hello World tapped!")
            
            let center = UNUserNotificationCenter.current()
            center.getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else { return }

                if settings.alertSetting == .enabled {
                    print("Allowed")
                } else {
                    print("Not allowed")
                }
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Meeting Reminder"
            content.subtitle = "test"
            content.body = "Don't forget to bring coffee."
            content.badge = 1

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                    repeats: false)

            let requestIdentifier = "demoNotification"
            let request = UNNotificationRequest(identifier: requestIdentifier,
                    content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request,
                 withCompletionHandler: { (error) in
                     // Handle error
             })
            
        }){
         Text("Hello World")
            .foregroundColor(.blue)
            .padding()
            .border(Color.blue, width: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
