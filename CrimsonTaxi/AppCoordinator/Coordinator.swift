//
//  Coordinator.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import UIKit

typealias CoordinatorHandler = ()->()

protocol Coordinator: AnyObject {
    
    var completionHandler: CoordinatorHandler? { get set }
    var navigationController: UINavigationController? { get set }
    
    func start()
    
}
