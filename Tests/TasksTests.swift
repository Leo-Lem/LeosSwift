//	Created by Leopold Lemmermann on 14.11.22.

@testable import ExtendedConcurrency
import XCTest

final class TasksTests: XCTestCase {
  private var tasks = Tasks()

  override func setUp() {
    tasks = Tasks()
  }

  func testAddingAnonymousTask() {
    tasks.add(Task<Void, Never> { print("Task executed") })
    
    XCTAssertTrue(tasks.anonymousTasks.count == 1, "Task was not inserted.")
  }
  
  func testAddingTaskWithID() {
    tasks["task1"] = Task<Void, Never> { print("Task executed") }
    
    XCTAssertNotNil(tasks.tasksWithID["task1"], "Task was not added at key.")
  }
  
  func testRemovingTaskWithID() {
    tasks["task1"] = Task<Void, Never> { print("Task executed") }
    tasks["task1"] = nil
    
    XCTAssertNil(tasks.tasksWithID["task1"], "Task was not removed.")
  }
  
  @available(iOS 16, macOS 12, *)
  func testTasksAreCancelledOnDeinit() {
    let task = Task<Void, Never> { await sleep(for: .seconds(10)) }
    
    tasks.add(task)
    tasks["task1"] = task
    
    tasks = Tasks()
    
    XCTAssertTrue(task.isCancelled, "Task was not cancelled in deinit.")
  }
}
