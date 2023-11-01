//
//  CoordinatorFactory.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import UIKit

final class CoordinatorFactory {
    
    func createRegistrationCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator()
    }
    
    func createMainTabBarCoordinator() -> MainTabBarCoordinator {
        MainTabBarCoordinator()
    }
    
}
