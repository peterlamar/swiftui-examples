//
//  ContentView.swift
//  buttonStateChange
//
//  Created by Peter Lamar on 3/19/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var sColor = Color.black

    var body: some View {
        return VStack {
            Button("Tap Me!") {
                print("button pressed!")
                self.sColor = Color.red

            }.buttonStyle(MyButtonStyle(color: sColor))
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    var color: Color

    public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
        print("inside button style")
        print(color)

        return configuration.label
            .foregroundColor(.white)
            .padding(15)
            .background(RoundedRectangle(cornerRadius: 5).fill(color))
            .compositingGroup()
            .shadow(color: .black, radius: 3)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
