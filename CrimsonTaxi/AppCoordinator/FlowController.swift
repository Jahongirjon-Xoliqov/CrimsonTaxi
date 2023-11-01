//
//  FlowCoordinator.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import Foundation

protocol FlowController {
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
