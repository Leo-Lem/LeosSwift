//	Created by Leopold Lemmermann on 25.10.22.

public extension Query {
  struct Options {
    let maxItems: Int?

    public init(
      maxItems: Int? = nil
    ) {
      self.maxItems = maxItems
    }
  }
}
