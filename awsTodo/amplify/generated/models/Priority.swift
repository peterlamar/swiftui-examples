// swiftlint:disable all
import Amplify
import Foundation

public enum Priority: String, EnumPersistable {
  case low = "LOW"
  case normal = "NORMAL"
  case high = "HIGH"
}