//
//  RegistrationCoordinator.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import UIKit

final class RegistrationCoordinator: Coordinator {
    
    var completionHandler: CoordinatorHandler?
    var navigationController: UINavigationController?
    
    private let modulesFactory = ModulesFactory()
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func start() {
        showPersonalDataModule()
    }
    
    private func showPersonalDataModule() {
        
        let controller = modulesFactory.createPersonalDataController()
        
        controller.completionHandler = { [weak self] value in
            guard let self else { return }
            self.showVerificationModule()
        }
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    private func showVerificationModule() {
        
        let controller = modulesFactory.createVerificationController()
        
        controller.completionHandler = { [weak self] value in
            guard let self else { return }
            completionHandler?()
        }
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}


