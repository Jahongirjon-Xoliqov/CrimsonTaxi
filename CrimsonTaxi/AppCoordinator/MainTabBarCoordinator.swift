//
//  MainTabBarCoordinator.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    var completionHandler: CoordinatorHandler?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    init() {
        self.navigationController = BaseNavigationController()
    }
    
    private let modulesFactory = ModulesFactory()
    
    func start() {
        
        let tabbar = modulesFactory.createMainTabBarController()
        
        tabbar.themeChangeAction = { [weak self] in
            guard let self else { return }
            let controller = modulesFactory.createThemeConfController()
            navigationController?.pushViewController(controller, animated: true)
        }
        
        tabbar.languageChangeAction = { [weak self] in
            guard let self else { return }
            let controller = modulesFactory.createLanguageConfController()
            navigationController?.pushViewController(controller, animated: true)
        }
        
        navigationController?.setViewControllers([tabbar], animated: true)
        
    }
    
}
