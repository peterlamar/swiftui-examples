//
//  ContentView.swift
//  Shared
//
//  Created by Peter Lamar on 3/14/21.
//

import SwiftUI
import Firebase


struct ContentView: View {
    private let db = Firestore.firestore()

    init(){

        let docRef = db.collection("cities").document("SF")

        docRef.getDocument { (document, error) in
            // Optional binding, completed in order
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                let property = document.get("name")
                print("name field: \(String(describing: property))")
            } else {
                print("Document does not exist")
            }
        }
 
        
        let docRef2 = db.collection("cities").document("BJ")

        docRef2.getDocument { (document, error) in
            // Construct a Result type to encapsulate deserialization errors or
            // successful deserialization. Note that if there is no error thrown
            // the value may still be `nil`, indicating a successful deserialization
            // of a value that does not exist.
            //
            // There are thus three cases to handle, which Swift lets us describe
            // nicely with built-in Result types:
            //
            //      Result
            //        /\
            //   Error  Optional<City>
            //               /\
            //            Nil  City
            let result = Result {
              document?.data()
            }
            switch result {
            case Result.success(let city):
                if let city = city {
                    // A `City` value was successfully initialized from the DocumentSnapshot.
                    print("City: \(city)")
                } else {
                    // A nil value was successfully initialized from the DocumentSnapshot,
                    // or the DocumentSnapshot was nil.
                    print("Document does not exist")
                }
            case .failure(let error):
                // A `City` value could not be initialized from the DocumentSnapshot.
                print("Error decoding city: \(error)")
            }
        }
        
        db.collection("cities").whereField("capital", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }

          
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// [START codable_struct]
public struct City: Codable {

    let name: String
    let state: String?
    let country: String?
    let isCapital: Bool?
    let population: Int64?

    enum CodingKeys: String, CodingKey {
        case name
        case state
        case country
        case isCapital = "capital"
        case population
    }

}
