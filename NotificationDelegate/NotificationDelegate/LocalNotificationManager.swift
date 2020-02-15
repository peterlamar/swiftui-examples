//
//  LocalNotificationManager.swift
//  NotificationDelegate
//
//  Created by Peter Lamar on 2/14/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationManager {
    var notifications = [Notification]()

    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in

            if granted == true, error == nil {
                self.scheduleNotifications()
            }
        }
    }

    func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in

            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                print("Notification not authorized!")
                // Do nothing
            }
        }
    }

    private func scheduleNotifications() {
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.body = notification.message
            content.sound = .default

            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.datetime, repeats: false)

            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in

                guard error == nil else { return }

                print("Notification scheduled! --- ID = \(notification.id)")
            }
        }
    }
}

struct Notification {
    var id: String
    var title: String
    var message: String
    var datetime: DateComponents
}
