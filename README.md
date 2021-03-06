# IOS-Examples SwiftUI

1. [Local Notification](https://github.com/peterlamar/ios-examples/tree/master/usernotification) - Simple background notifications only
1. [Foreground Notifcations](https://github.com/peterlamar/ios-examples/tree/master/NotificationDelegate) - Notifications that also occur in the foreground while your app is open. 
1. [ViewBuilder](https://github.com/peterlamar/ios-examples/tree/master/viewbuilder)
1. [UserActionNotification](https://github.com/peterlamar/ios-examples/tree/master/userActionNotification) - Create user actions in Notifications that appear below the notification when viewed from the main screen

1. [buttonStateChange](https://github.com/peterlamar/ios-examples/tree/master/buttonStateChange) - Update a swiftUI button's state on button press
1. [buttonChangeText](https://github.com/peterlamar/ios-examples/tree/master/buttonChangeText) - Update a separate swiftUI text field from a button press
1. [exclusiveButton](https://github.com/peterlamar/ios-examples/tree/master/exclusiveButtons) - Exclusive OR implemented with two buttons, one turns on while it turns off the other. 
1. [listinlist](https://github.com/peterlamar/ios-examples/tree/master/listinlist) - Display a list in list
1. [animatedbuttons](https://github.com/peterlamar/ios-examples/tree/master/animatedButtons) - Basic example showing buttons with a scale effect on press as well as buttonstyle to apply to multiple buttons.
1. [transitionButtons](https://github.com/peterlamar/ios-examples/tree/master/transitionButtons) - Simple button that transitions into frame
1. [sublistDelete](https://github.com/peterlamar/ios-examples/tree/master/sublistDelete) - Delete from a sublist with tricky swiftui syntax
1. [coredatasample](https://github.com/peterlamar/ios-examples/tree/master/coredatasample) - Intro to storing data on iOS
1. [coredatarelationships](https://github.com/peterlamar/ios-examples/tree/master/coreDataRelationships) - Core data with swiftui and member objects
1. [photoLibrary](https://github.com/peterlamar/swiftui-examples/tree/master/photoLibrary) - load photos from phone's library using wrapped UIKit 

# IOS-Examples UIKit

1. [UI Kit Basics](https://github.com/peterlamar/ios-examples/tree/master/UIKitBasics) - Follow basic arrangement and understanding of UIKit and storyboard
1. [Storyboard Actions](https://github.com/peterlamar/ios-examples/tree/master/warCardGame) - Add functions to storyboard 
1. [UIKitNotification](https://github.com/peterlamar/ios-examples/tree/master/UIKitNotification) - Example of custom UIKit notification from Swift

# Combine Examples

1. [Basic Combine Example](https://www.avanderlee.com/swift/combine/) - Getting started, playground only example of pub/sub with Combine
1. [Full Combine Playground](https://github.com/AvdLee/CombineSwiftPlayground) - Full Combine playground with examples
1. [Combine Grid Layout](https://medium.com/better-programming/playing-with-combine-grid-layout-in-swiftui-42e652d6462e) - Simple example using combine to layout an array and images
1. [Visual Combine Magic](https://medium.com/flawless-app-stories/visualize-combine-magic-with-swiftui-part-1-3a56e2a461b3) - involved 4 step tutorial on swiftui and combine
1. [Combine Free E-Book](https://heckj.github.io/swiftui-notes/#aboutthisbook) - Full book about combine

# Cloud

1. [AWS AppSync/Combine Tutorial](https://github.com/peterlamar/swiftui-examples/tree/master/awsTodo) - Intro tutorial into AWS AppSync resources and service
1. [Firebase Swift2](https://github.com/peterlamar/swiftui-examples/tree/master/firebaseswift2) - Google exercises updated for swift2

## External Links Only

1. [Dynamic Lists](https://medium.com/flawless-app-stories/swiftui-dynamic-list-identifiable-73c56215f9ff)
1. [MVVM Example](https://www.letsbuildthatapp.com/guide/section/MVVM-ObservableObject-JSON-Fetching)
1. [UserNotifications Framework Delegate Protocol](https://www.devfright.com/use-usernotifications-framework-delegate-protocol/) - Handle notification actions
1. [Clean Architecture/Deep Linking example](https://github.com/nalexn/clean-architecture-swiftui/blob/master/CountriesSwiftUI/System/AppEnvironment.swift#L21)
1. [Navigate between views](https://blckbirds.com/post/how-to-navigate-between-views-in-swiftui-by-using-an-bindableobject/) - Great tutorial on Navigation thats not just the navigationview/list example but rather logic based between views
1. [Swift $ Prefix](https://insights.dice.com/2019/06/12/xcode-swiftui-dollar-sign-prefix/) - Explains that $ is a 'read/write binding'
1. [@Binding vs @Published](https://stackoverflow.com/questions/59203083/swiftui-and-combine-what-is-the-difference-between-published-and-binding) - 'You'll generally use @Binding to pass a binding that originated from some source of truth (like @State) down the view hierarchy and @Published in an ObservableObject to allow a view to react to changes to a property.'
1. [Expandable List](https://swiftsenpai.com/development/collectionview-expandable-list-part1/) Detailed UI kit implementation of an expandable list
1. [Async Image Loading](https://github.com/V8tr/AsyncImage) Demonstrates how to load images from urls with loading text

## Misc Useful Links

1. [Swift Reference](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
1. [Apple Swift Book](https://books.apple.com/us/book/swift-programming-language/id881256329)
1. [Awesome Swift](https://github.com/chinsyo/awesome-swiftui)
1. [Custom SwiftUI Control](https://www.youtube.com/watch?v=CwD4cScGCq8)
1. [Parsing JSON with Swift](https://benscheirman.com/2017/06/swift-json/)
1. [SwiftUI Guide](https://github.com/fzhlee/SwiftUI-Guide)
1. [TestFlight tutorial](https://www.raywenderlich.com/5352-testflight-tutorial-ios-beta-testing)
1. [Local notification testing](https://sarunw.com/posts/testing-remote-push-notification-in-ios-simulator/) 


# Swift Language Mechanics

1. [initDescribing](#initDescribing)
1. [map](#map)


## InitDescribing

[Creates a string representing the given value](https://developer.apple.com/documentation/swift/string/2427941-init) as a sort of [representation](https://stackoverflow.com/questions/50774273/what-is-the-different-between-stringdescribing-int-vs-stringint)

```swift
import Foundation
struct Person {
    var first: String
    var last: String
    var age: Int
}
let p = Person(first:"Matt", last:"Neuburg", age:3)
print("p is \(String(describing:p))")  // p is Person(first: "Matt", last: "Neuburg", age: 3)
let x = 3
print("x is \(String(describing:x))") // x is 3
var someTuple = (9, 99)  
print("someTuple is \(String(describing:someTuple))") // someTuple is (9, 99)
func someFunction(left: Int, right: Int) {}
print("someFunction is \(String(describing:someFunction))") // someFunction is (Function)
let someArray: [String] = ["Alex", "Brian", "Dave"]
print("someArray is \(String(describing:someArray))") // someArray is ["Alex", "Brian", "Dave"]
let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
print("someDictionary is \(String(describing:someDictionary))") // someDictionary is ["Paul": 39, "Alex": 31]
var optionalInteger: Int?
optionalInteger = 42
print("optionalInteger is \(String(describing:optionalInteger))") // optionalInteger is Optional(42)
```

## Map

[Returns an array containing the results of mapping the given closure over the sequence’s elements.](https://developer.apple.com/documentation/swift/array/3017522-map)

```swift
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowercaseNames = cast.map { $0.lowercased() } // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
let letterCounts = cast.map { $0.count } // 'letterCounts' == [6, 6, 3, 4]
```
