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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = BaseNavigationController(rootViewController: PersonalDataViewController())
        window?.makeKeyAndVisible()
        return true
    }
    
}

