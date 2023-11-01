//
//  AppCoordinator.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var completionHandler: CoordinatorHandler?
    var navigationController: UINavigationController?
    
    private var childCoordinators: [Coordinator] = []
    private var coordinatorFactory = CoordinatorFactory()
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func start() {
        if true {
            showRegister()
        } else {
            showMain()
        }
    }
    
    private func showRegister() {
        
        let registerCoordinator = coordinatorFactory.createRegistrationCoordinator(self.navigationController!)
        
        childCoordinators.append(registerCoordinator)
        
        registerCoordinator.completionHandler = { [weak self] in
            guard let self else { return }
            self.showMain()
        }
        
        registerCoordinator.start()
        
    }
    
    private func showMain() {
        
        let mainCoordinator = coordinatorFactory.createMainTabBarCoordinator(self.navigationController!)
        
        childCoordinators.append(mainCoordinator)
        
        mainCoordinator.start()
        
    }
    
    
}
