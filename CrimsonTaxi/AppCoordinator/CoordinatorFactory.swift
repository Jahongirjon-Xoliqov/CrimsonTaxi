//
//  CoordinatorFactory.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import UIKit

final class CoordinatorFactory {
    
    func createRegistrationCoordinator(_ navController: UINavigationController?) -> RegistrationCoordinator {
        RegistrationCoordinator(navigationController: navController)
    }
    
    func createMainTabBarCoordinator(_ navController: UINavigationController?) -> MainTabBarCoordinator {
        MainTabBarCoordinator(navigationController: navController)
    }
    
}
