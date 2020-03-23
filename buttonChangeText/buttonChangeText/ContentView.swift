//
//  ContentView.swift
//  buttonChangeText
//
//  Created by Peter Lamar on 3/23/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    @State var colors: [Color] = [Color.white, Color.white]

    var body: some View {
        HStack {
            Spacer()

            Button(
                action: { self.switchSelection(index: 0) },
                label: { Text("Pick Me") }
            ).background(colors[0])
            Spacer()
            Button(
                action: { self.switchSelection(index: 1) },
                label: { Text("No, Pick Me") }
            ).background(colors[1])
            Spacer()
        }
    }

    func switchSelection(index: Int) {
        if index == 0 {
            colors[0] = Color.orange
            colors[1] = Color.white
        } else if index == 1 {
            colors[0] = Color.white
            colors[1] = Color.orange
        }
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
