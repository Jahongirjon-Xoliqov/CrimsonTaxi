//
//  MainTabBarView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

class MainTabBarView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var homeTabBarItemView: UIView!
    @IBOutlet weak var profileTabBarItemView: UIView!
    @IBOutlet weak var homeTabBarItemImageView: UIImageView!
    @IBOutlet weak var profileTabBarItemImageView: UIImageView!

    var homeBecomeActive: CommonAction?
    var profileBecomeActive: CommonAction?
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        clearBackground()
        configure()
    }
    private func configure() {
        applyShadow()
        selfView.backgroundColor = Theme.current.background
        homeTabBarItemImageView.image = UIImage(named: "homeFill")
        homeTabBarItemImageView.tintColor = Theme.current.primary
        homeTabBarItemView.backgroundColor = Theme.current.background
        homeTabBarItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(homeTabBarItemTapped)))
        profileTabBarItemImageView.image = UIImage(named: "profile")
        profileTabBarItemImageView.tintColor = Theme.current.secondary
        profileTabBarItemView.backgroundColor = Theme.current.background
        profileTabBarItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileTabBarItemTapped)))
    }
    
    @objc private func homeTabBarItemTapped() {
        homeTabBarItemImageView.image = UIImage(named: "homeFill")
        homeTabBarItemImageView.tintColor = Theme.current.primary
        profileTabBarItemImageView.image = UIImage(named: "profile")
        profileTabBarItemImageView.tintColor = Theme.current.secondary
        homeBecomeActive?()
    }
    
    @objc private func profileTabBarItemTapped() {
        homeTabBarItemImageView.image = UIImage(named: "home")
        homeTabBarItemImageView.tintColor = Theme.current.secondary
        profileTabBarItemImageView.image = UIImage(named: "profileFill")
        profileTabBarItemImageView.tintColor = Theme.current.primary
        profileBecomeActive?()
    }
    
    func modifyColors(_ selectedTabBarIndex: Int) {
        selfView.backgroundColor = Theme.current.background
        homeTabBarItemView.backgroundColor = Theme.current.background
        profileTabBarItemView.backgroundColor = Theme.current.background
        homeTabBarItemImageView.tintColor = selectedTabBarIndex == 0 ? Theme.current.primary : Theme.current.secondary
        profileTabBarItemImageView.tintColor = selectedTabBarIndex == 1 ? Theme.current.primary : Theme.current.secondary
    }
    
}

