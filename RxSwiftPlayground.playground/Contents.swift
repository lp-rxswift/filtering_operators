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
  let strikes = PublishSubject<String>()
  let disposeBag = DisposeBag()
  strikes
    .elementAt(2)
    .subscribe(onNext: { _ in
      print("You're out!")
    })
    .disposed(by: disposeBag)

  strikes.onNext("X")
  strikes.onNext("X")
  strikes.onNext("X")
}

example(of: "Filter") {
  let disposeBag = DisposeBag()
  Observable.of(1, 2, 3, 4, 5, 6)
    .filter({ $0.isMultiple(of: 2) })
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)
}

example(of: "Skip") {
  let disposeBag = DisposeBag()
  Observable.of("A", "B", "C", "D", "E", "F")
    .skip(3)
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)
}

example(of: "Skip while") {
  let disposeBag = DisposeBag()
  Observable.of(2, 2, 3, 4, 4)
    .skipWhile({ $0.isMultiple(of: 2) })
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)
}
