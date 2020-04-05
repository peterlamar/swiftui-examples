//
//  ContentView.swift
//  listinlist
//
//  Created by Peter Lamar on 4/5/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List { // next pattern easily wrapped with ForEach
            ItemRow("Category", isCategory: true) // this can be section's header
            Section {
                ItemRow("Item 1")
                ItemRow("Item 2")
                ItemRow("Item 3")
            }.padding(.leading, 20)

            ItemRow("Category2", isCategory: true) // this can be section's header
            Section {
                ItemRow("Item 1")
                ItemRow("Item 2")
                ItemRow("Item 3")
            }.padding(.leading, 20)
        }
    }
}

struct ItemRow: View {
    let category: Bool
    let text: String

    init(_ text: String, isCategory: Bool = false) {
        category = isCategory
        self.text = text
    }

    var body: some View {
        HStack {
            Circle().stroke() // this can be custom control
                .frame(width: 20, height: 20)
                .onTapGesture {
                    // handle tap here
                }
            if category {
                Text(self.text).bold()
            } else {
                Text(self.text)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
