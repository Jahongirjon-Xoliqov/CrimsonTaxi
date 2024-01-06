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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        rootCoordinator = AppCoordinator(navigationController: BaseNavigationController())
        
        window = UIWindow()
        window?.rootViewController = AppContainerViewController()//rootCoordinator?.navigationController
        window?.makeKeyAndVisible()
        
        //rootCoordinator?.start()
        
        return true
    }
    
}

