//
//  ContentView.swift
//  Landmarks
//
//  Created by Peter Lamar on 1/15/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage()
                .padding(.bottom, -130)
                .offset( y: -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Foot")
                    .font(.title)
                    .foregroundColor(.green)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
        
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
