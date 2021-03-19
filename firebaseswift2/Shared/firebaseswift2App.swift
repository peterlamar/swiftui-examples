//
//  firebaseswift2App.swift
//  Shared
//
//  Created by Peter Lamar on 3/14/21.
//

import Firebase
import SwiftUI

@main
struct firebaseswift2App: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
