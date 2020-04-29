//
//  ContentView.swift
//  transitionButtons
//
//  Created by Peter Lamar on 4/28/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false

    var body: some View {
        VStack {
            Spacer()

            if show {
                LabelView()
                    .transition(.myOpacity)
            }

            Spacer()

            Button("Animate") {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.show.toggle()
                }
            }.padding(20)
        }
    }
}

extension AnyTransition {
    static var myOpacity: AnyTransition {
        AnyTransition.modifier(
            active: MyOpacityModifier(opacity: 0),
            identity: MyOpacityModifier(opacity: 1)
        )
    }
}

struct MyOpacityModifier: ViewModifier {
    let opacity: Double

    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}

struct LabelView: View {
    var body: some View {
        Text("Hi there!")
            .padding(10)
            .font(.title)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.green).shadow(color: .gray, radius: 3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
