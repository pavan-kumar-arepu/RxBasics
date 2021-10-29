//
//  ViewController.swift
//  RxBaseEx
//
//  Created by Pavankumar Arepu on 28/08/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    var publishSubject = PublishSubject<String>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // publicSubjectFunction()
       // publicSubjectExFunction()
       // mapFunction()
       // filterFunction()
        flatMapFunction()
    }
    
    // fdfdsfMARK: - ViewController Life Cycle Methodsf
    //

    

    //===============================================
    //ObservableSequence
    //===============================================
    
    func obsSeqExample() {
        
        // Do any additional setup after loading the view.
        let myFirstSequence = Observable.just("Hello RxSwift")
        
        let fibinociSequence = Observable.from([0,1,1,2,3,5,8])
        
        let myFirstSubscription = myFirstSequence.subscribe { (event) in
            print("Event:", event)
        }
    }
    //===============================================
    //Subscription
    //===============================================
    
    func subExample() {
        
        let newSequence = Observable.from(["B","H","A","R","G","A","V"])
        
        let subscription = newSequence.subscribe { event in
            switch event {
            case .next(let value):
                print(value)
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
            }
        }
    }
    
    //===============================================
    // Subjects
    //===============================================
    func disBagEx() {
        let disBag = DisposeBag()
        
        let observable = Observable.just("Hello Rx")
        
        let subscription = observable.subscribe(onNext:{
            print($0)
        })
        subscription.disposed(by: disBag)
    }
    
    //===============================================
    // Subjects - Publish Subject
    //===============================================
    
    func publicSubjectFunction() {
        let bag = DisposeBag()
        
        publishSubject.onNext("Hello")
        publishSubject.onNext("World")
    }
    
    //===============================================
    // Subjects - Behaviour Subject
    //===============================================
    
    func publicSubjectExFunction() {
        let bag = DisposeBag()
//        let subscription1 = publishSubject.subscribe(onNext:{
//          print($0)
//        }).addDisposableTo(bag)

        publishSubject.onNext("Hello")
        let subScription1 = publishSubject.subscribe(onNext: {
            print($0)
        }).disposed(by: bag)
        
         publishSubject.onNext("World")
    }
    //===============================================
    // High Order Functions - Map
    //===============================================
    func mapFunction() {
        Observable<Int>
            .of(1,2,3,4,5,5,6,7,8)
            .map { value in
                return value * value
            }.subscribe(onNext : {
                print($0)
            })
    }
    
    //===============================================
    // High Order Functions - Filter
    //===============================================
    func filterFunction() {
        Observable<Int>
            .of(12,13,14,15)
            .filter {$0>13}
            .subscribe(onNext : {
                print($0)
            })
    }
    
    //===============================================
    // High Order Functions - FlatMap
    //===============================================
    
    func flatMapFunction() {
        let observable1  = Observable<Int>.of(1,2)
        let observable2  = Observable<Int>.of(3,4)
        let observableOfObservables = Observable.of(observable1,observable2)
        observableOfObservables
            .subscribe(onNext:{
            print($0)
        })
//        observableOfObservables.flatMap{ return $0 }
//            .subscribe(onNext:{
//            print($0)
//        })
    }
}
