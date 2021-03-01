// swiftlint:disable all
import Amplify
import Foundation

extension Todo {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case priority
    case description
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let todo = Todo.keys
    
    model.pluralName = "Todos"
    
    model.fields(
      .id(),
      .field(todo.name, is: .required, ofType: .string),
      .field(todo.priority, is: .optional, ofType: .enum(type: Priority.self)),
      .field(todo.description, is: .optional, ofType: .string)
    )
    }
}