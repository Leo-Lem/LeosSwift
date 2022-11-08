//	Created by Leopold Lemmermann on 21.10.22.

public protocol KeyPathQueryable {
  static var keyPathDictionary: [PartialKeyPath<Self>: String] { get }
}

public extension KeyPathQueryable {
  static func mapToPropertyName(_ keyPath: PartialKeyPath<Self>) -> String? {
    keyPathDictionary[keyPath]
  }
}

public extension PartialKeyPath where Root: KeyPathQueryable {
  var propertyName: String? { Root.mapToPropertyName(self) }
}
