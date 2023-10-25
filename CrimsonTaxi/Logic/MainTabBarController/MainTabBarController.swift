//
//  MainTabBarController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    var tabBarView: MainTabBarView = {
        MainTabBarView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        view.addSubview(tabBarView)
        view.backgroundColor = Theme.current.background
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabBarView.heightAnchor.constraint(equalToConstant: 70 + safeAreaBottomHeight).isActive = true
        
        tabBarView.homeBecomeActive = { [weak self] in
            guard let self else { return }
            self.selectedIndex = 0
        }
        
        tabBarView.profileBecomeActive = { [weak self] in
            guard let self else { return }
            self.selectedIndex = 1
        }
    
        let homeViewController = BaseNavigationController(rootViewController: HomeViewController())
        let profileViewController = BaseNavigationController(rootViewController: VerificationViewController())
        
        setViewControllers([homeViewController, profileViewController], animated: false)
        
    }
        
}
