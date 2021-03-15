//
//  firebaseswift2App.swift
//  Shared
//
//  Created by Peter Lamar on 3/14/21.
//

import SwiftUI
import Firebase

@main
struct firebaseswift2App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
