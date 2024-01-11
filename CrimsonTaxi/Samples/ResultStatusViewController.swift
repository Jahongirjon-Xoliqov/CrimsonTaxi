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
    }
    
}
