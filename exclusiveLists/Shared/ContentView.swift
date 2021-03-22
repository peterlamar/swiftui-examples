//
//  ContentView.swift
//  Shared
//
//  Created by Peter Lamar on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
        var id: Self { self }
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch children {
            case nil:
                return "📄 \(name)"
            case let .some(children):
                return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }

    let fileHierarchyData: [FileItem] = [
        FileItem(name: "users", children:
            [FileItem(name: "user1234", children:
                [FileItem(name: "Photos", children:
                    [FileItem(name: "photo001.jpg"),
                     FileItem(name: "photo002.jpg")]),
                FileItem(name: "Movies", children:
                    [FileItem(name: "movie001.mp4")]),
                FileItem(name: "Documents", children: [])]),
            FileItem(name: "newuser", children:
                [FileItem(name: "Documents", children: [])])]),
        FileItem(name: "private", children: nil),
    ]
    var body: some View {
        List(fileHierarchyData, children: \.children) { item in
            Text(item.description)
        }
    }
}
