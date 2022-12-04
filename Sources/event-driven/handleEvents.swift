//	Created by Leopold Lemmermann on 04.12.22.

@available(iOS 15, macOS 12, *)
public extension EventDriven {
  var events: AsyncStream<Event> { eventPublisher.stream }
  
  func handleEvent(with handler: (Event) async throws -> Void) async rethrows {
    for await event in events { try await handler(event) }
  }
}
