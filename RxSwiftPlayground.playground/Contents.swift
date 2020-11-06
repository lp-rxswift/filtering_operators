import Foundation
import RxSwift

example(of: "Ignore elements") {
  let strikes = PublishSubject<String>()
  let disposeBag = DisposeBag()

  strikes
    .ignoreElements()
    .subscribe { _ in
      print("You're out!")
    }
    .disposed(by: disposeBag)

  strikes.onNext("X")
  strikes.onNext("X")
  strikes.onNext("X")
  strikes.onCompleted()
}

example(of: "Element at") {
  
}

