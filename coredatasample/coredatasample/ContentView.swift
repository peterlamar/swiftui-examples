//
//  ContentView.swift
//  coredatasample
//
//  Created by Peter Lamar on 5/20/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        VStack {
            
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!

                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
