//
//  ThemeConfViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 27/10/23.
//

import UIKit

class ThemeConfViewController: BaseViewController {

    @IBOutlet weak var navTitleView: NavTitleView!
    @IBOutlet weak var darkThemeButton: PrimaryButton!
    @IBOutlet weak var lightThemeButton: PrimaryButton!
    @IBOutlet weak var crimsonThemeButton: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        navTitleView.enableBackButton(true)
        navTitleView.set(title: "Choose theme")
        navTitleView.backTapAction = { [weak self] in
            guard let _ = self else { return }
            self?.navController?.popViewController(animated: true)
        }
        
        lightThemeButton.set(title: "Light")
        lightThemeButton.tapAction = { [weak self] in
            guard let _ = self else { return }
            Theme.settings.updateTheme(LightTheme())
        }
        
        darkThemeButton.set(title: "Dark")
        darkThemeButton.tapAction = { [weak self] in
            guard let _ = self else { return }
            Theme.settings.updateTheme(DarkTheme())
        }
        
        crimsonThemeButton.set(title: "Crimson")
        crimsonThemeButton.tapAction = { [weak self] in
            guard let _ = self else { return }
            //Theme.settings.updateTheme(CrimsonTheme())
        }
        
    }

    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = Theme.current.background
    }
    
}
