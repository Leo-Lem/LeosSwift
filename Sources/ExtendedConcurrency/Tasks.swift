//	Created by Leopold Lemmermann on 31.10.22.

/// A collection of tasks, which primarily handles cancelling tasks on deinitialization
public class Tasks<Key: Hashable> {
  private var tasks = [Key: Task<Any, Error>](),
              anonymousTasks = [Task<Any, Error>]()

  public init() {}
  
  deinit {
    for task in anonymousTasks { task.cancel() }
    for (_, task) in tasks { task.cancel() }
  }
}

// anonymous tasks
public extension Tasks {
  /// Add a task anonymously (e.g., when you don' t care about manually stopping it)
  /// - Parameter tasks: Variadic argument of tasks.
  func add(_ tasks: Task<Any, Error>...) { add(tasks) }

  /// Add a task anonymously (e.g., when you don' t care about manually stopping it)
  /// - Parameter tasks: An array of tasks.
  func add(_ tasks: [Task<Any, Error>]) {
    for task in tasks { anonymousTasks.append(task) }
  }
}

// id tasks
public extension Tasks {
  subscript(_ key: Key) -> Task<Any, Error>? {
    get { tasks[key] }
    set {
      tasks[key]?.cancel()
      tasks[key] = newValue
    }
  }
}
