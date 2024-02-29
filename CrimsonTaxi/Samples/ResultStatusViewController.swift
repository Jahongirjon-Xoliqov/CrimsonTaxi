//
//  ResultStatusViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 11/01/24.
//

import UIKit


final class ResultStatusViewController: UIViewController {

    private var result: TransactionResultActionProtocol!
    
    convenience init(with result: TransactionResultActionProtocol) {
        self.init()
        self.result = result
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action(_ sender: Any) {
        let action = self.result.subactions!.first!.action
        action?()
//        let parentInstance: ParentClass = ChildClass()
//        parentInstance.someMethod()
        
    }
    
}

protocol AB {
    var fun: String { get set }
    func func2()
}

protocol AC: AB {
    
}
class II: AC {
    var fun: String
    init(fun: String) {
        self.fun = fun
    }
    func func2() {
        
    }
    
    
}
class A {
    func action() {
        print("class A")
    }
}

class B: A {
    override func action() {
        print("class B")
    }
}

class C: B {
    override func action() {
        print("class C")
    }
}

class ParentClass {
    func someMethod() {
        print("ParentClass - someMethod")
    }
}

class ChildClass: ParentClass {
    override func someMethod() {
        print("ChildClass - someMethod")
    }
}


