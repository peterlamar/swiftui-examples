// swiftlint:disable all
import Amplify
import Foundation

public struct Todo: Model {
  public let id: String
  public var name: String
  public var priority: Priority?
  public var description: String?
  
  public init(id: String = UUID().uuidString,
      name: String,
      priority: Priority? = nil,
      description: String? = nil) {
      self.id = id
      self.name = name
      self.priority = priority
      self.description = description
  }
}