//
//  MainTabBarController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    var tabBarView: MainTabBarView = {
        MainTabBarView()
    }()
    
    var themeChangeAction: CommonAction?
    var languageChangeAction: CommonAction?
    
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
    
        let homeController = HomeViewController()
        
        let profileController = ProfileViewController()
        profileController.themeChangeAction = { [weak self] in
            guard let self else { return }
            themeChangeAction?()
        }
        profileController.langugeChangeAction = { [weak self] in
            guard let self else { return }
            languageChangeAction?()
        }
        
        let homeViewController = BaseNavigationController(rootViewController: homeController)
        let profileViewController = BaseNavigationController(rootViewController: profileController)
        
        setViewControllers([homeViewController, profileViewController], animated: false)
        
        subscribeForThemeModifications()
        
    }
    
    private func subscribeForThemeModifications() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: themeChangeNotificationName), object: nil, queue: .main) { _ in
            self.view.backgroundColor = Theme.current.background
            self.tabBarView.modifyColors(self.selectedIndex)
        }
    }
    
    
    
}
