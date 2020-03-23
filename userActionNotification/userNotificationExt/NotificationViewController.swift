//
//  NotificationViewController.swift
//  userNotificationExt
//
//  Created by Peter Lamar on 2/19/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }

    func didReceive(_ notification: UNNotification) {
        label?.text = notification.request.content.body
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler _:
        (UNNotificationContentExtensionResponseOption) -> Void) {
        guard let currentActions = extensionContext?.notificationActions else { return }

        if response.actionIdentifier == "yes-action" {
            print("All your money are belong to us")
        }
        if response.actionIdentifier == "no-action" {
            print("Resistence is futile")
        }
    }
}
