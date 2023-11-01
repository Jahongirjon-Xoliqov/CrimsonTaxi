//
//  AppDelegate.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 16/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    private var rootCoordinator: Coordinator?
    private let coordinatorFactory = CoordinatorFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if false {
            rootCoordinator = coordinatorFactory.createMainTabBarCoordinator()
        } else {
            rootCoordinator = coordinatorFactory.createRegistrationCoordinator()
            rootCoordinator?.completionHandler = { [weak self] in
                guard let self else { return }
                
                rootCoordinator = coordinatorFactory.createMainTabBarCoordinator()
                window?.rootViewController = rootCoordinator?.navigationController
                rootCoordinator?.start()
                
            }
        }
        
        window = UIWindow()
        window?.rootViewController = rootCoordinator?.navigationController
        window?.makeKeyAndVisible()
        
        rootCoordinator?.start()
        
        return true
    }
    
}

