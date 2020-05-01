//
//  ContentView.swift
//  sublistDelete
//
//  Created by Peter Lamar on 4/29/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var data: [String: [String]] = ["DeptA": ["EmpA", "EmpB", "EmpC"],
                                    "DeptB": ["EmpD", "EmpE", "EmpF"]]
    var sections: [String] { data.keys.map { $0 } }
    func rows(section: Int) -> [String] { data[sections[section]]! }

    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< sections.count, id: \.self) { section in
                    Section(header: Text(self.sections[section])) {
                        ForEach(self.rows(section: section), id: \.self) { emp in
                            Text(emp)
                        }.onDelete { row in
                            self.deleteEmp(section: section, row: row)
                        }
                    }
                }
            }.navigationBarTitle("Employees")
        }
    }

    private func deleteEmp(section: Int, row: IndexSet) {
        print("Section:", section)
        print("Row:", row.first!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
