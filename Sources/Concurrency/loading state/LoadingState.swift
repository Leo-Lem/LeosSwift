//	Created by Leopold Lemmermann on 25.10.22.

public enum LoadingState<T> {
  case idle,
       loading([T]),
       loaded([T] = []),
       failed(Error?)
}
