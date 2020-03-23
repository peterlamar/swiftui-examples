//
//  ContentView.swift
//  UIKitNotification
//
//  Created by Peter Lamar on 2/27/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        let hiddenPreviewsPlaceholder = "Really cool preview"

        let playAction = UNNotificationAction(identifier: "yes-action", title: "Take All My Money", options: [])
        let queueAction = UNNotificationAction(identifier: "no-action", title: "Please No", options: [])

        // #1.1 - Create "the notification's category value--its type."
        let myNotifCategory = UNNotificationCategory(identifier: "myNotificationCategory", actions: [playAction, queueAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: hiddenPreviewsPlaceholder, options: [])
        // #1.2 - Register the notification type.
        UNUserNotificationCenter.current().setNotificationCategories([myNotifCategory])

        return VStack {
            Button(action: {
                print("Alarm Created")

                // find out what are the user's notification preferences
                UNUserNotificationCenter.current().getNotificationSettings { settings in

                    // we're only going to create and schedule a notification
                    // if the user has kept notifications authorized for this app
                    guard settings.authorizationStatus == .authorized else { return }

                    // create the content and style for the local notification
                    let content = UNMutableNotificationContent()

                    // #2.1 - "Assign a value to this property that matches the identifier
                    // property of one of the UNNotificationCategory objects you
                    // previously registered with your app."
                    content.categoryIdentifier = "myNotificationCategory"

                    // create the notification's content to be presented
                    // to the user

                    content.title = "DEBIT OVERDRAFT NOTICE!"

                    content.subtitle = "Exceeded balance by $2."
                    content.body = "One-time overdraft fee is $500. Should we cover transaction?"
                    content.sound = UNNotificationSound.default

                    // #2.2 - create a "trigger condition that causes a notification
                    // to be delivered after the specified amount of time elapses";
                    // deliver after 10 seconds
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

                    // create a "request to schedule a local notification, which
                    // includes the content of the notification and the trigger conditions for delivery"
                    let uuidString = UUID().uuidString
                    let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

                    // "Upon calling this method, the system begins tracking the
                    // trigger conditions associated with your request. When the
                    // trigger condition is met, the system delivers your notification."
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                }

            }) {
                HStack {
                    Text("Create Alarm in 10 seconds")
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
