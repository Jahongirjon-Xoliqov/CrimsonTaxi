//
//  BaseNavigationController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .empty
        navigationItem.title = .empty
        navigationBar.isHidden = true
    }
    
}
