//
//  ModulesFactory.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/11/23.
//

import Foundation


final class ModulesFactory {
    
    func createPersonalDataController() -> PersonalDataViewController {
        PersonalDataViewController()
    }
    
    func createVerificationController() -> VerificationViewController {
        VerificationViewController()
    }
    
    func createMainTabBarController() -> MainTabBarController {
        MainTabBarController()
    }
    
    func createThemeConfController() -> ThemeConfViewController {
        ThemeConfViewController()
    }
    
    func createLanguageConfController() -> ThemeConfViewController {
        ThemeConfViewController()
    }
    
}
