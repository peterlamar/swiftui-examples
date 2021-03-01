//
//  awsTodoApp.swift
//  Shared
//
//  Created by Peter Lamar on 2/28/21.
//

import SwiftUI
import Amplify
import AmplifyPlugins

func configureAmplify() {
    let models = AmplifyModels()
    let apiPlugin = AWSAPIPlugin(modelRegistration: models)
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)
    do {
        try Amplify.add(plugin: apiPlugin)
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.configure()
        print("Initialized Amplify")
    } catch {
        print("Could not initialize Amplify: \(error)")
    }
}

@main
struct awsTodoApp: App {
    public init() {
         configureAmplify()
     }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
