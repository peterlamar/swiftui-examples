//
//  NotificationViewController.swift
//  NtnExl
//
//  Created by Peter Lamar on 2/27/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet var SubLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }

    // Init
    func didReceive(_: UNNotification) {
        SubLabel?.text = "Short impressive subtitle"
    }

    // This runs when button is pressed
    func didReceive(_ response: UNNotificationResponse, completionHandler _:
        (UNNotificationContentExtensionResponseOption) -> Void) {
        print("code ran")

        guard let currentActions = extensionContext?.notificationActions else { return }

        if response.actionIdentifier == "yes-action" {
            print("All your money are belong to us")
        }
        if response.actionIdentifier == "no-action" {
            print("Resistence is futile")
        }
    }
}
