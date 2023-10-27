//
//  ProfileViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 26/10/23.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImagePlaceholder: IconButton!
    @IBOutlet weak var nameFieldView: InputFieldView!
    @IBOutlet weak var phoneFieldView: InputFieldView!
    @IBOutlet weak var maleButton: SelectableView!
    @IBOutlet weak var femaleButton: SelectableView!
    @IBOutlet weak var saveButton: PrimaryButton!
    @IBOutlet weak var languageButton: AppButton!
    @IBOutlet weak var themeButton: AppButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
        scrollView.contentInset = UIEdgeInsets(top: 30,
                                               left: 0,
                                               bottom: 100,
                                               right: 0)
        
        profileImageView.image = UIImage(named: "")
        profileImagePlaceholder.set(image: UIImage(named: "profileFill"))
        profileImagePlaceholder.tapAction = { [weak self] in
            guard let self else { return }
            print("profile photo change")
        }
        
        nameFieldView.set(image: UIImage(named: "profile"))
        nameFieldView.set(placeholder: "Full Name")
        
        phoneFieldView.set(image: UIImage(named: "phone"))
        phoneFieldView.set(placeholder: "Contact Number")
        
        saveButton.set(title: "Save")
        saveButton.tapAction = { [weak self] in
            guard let self else { return }
            print("save button tapped")
        }
        
        maleButton.set(title: "Male")
        maleButton.set(image: UIImage(named: "profile"))
        maleButton.becomeActiveAction = { [weak self] in
            guard let self else { return }
            self.maleButton.set(state: .seleted)
            self.femaleButton.set(state: .default)
            Theme.settings.updateTheme(DarkTheme())
        }
        
        femaleButton.set(title: "Female")
        femaleButton.set(image: UIImage(named: "female"))
        femaleButton.becomeActiveAction = { [weak self] in
            guard let self else { return }
            self.femaleButton.set(state: .seleted)
            self.maleButton.set(state: .default)
            Theme.settings.updateTheme(LightTheme())
        }
        
        themeButton.addTarget(self, 
                              action: #selector(themeButtonTapped),
                              for: .touchUpInside)
        languageButton.addTarget(self, 
                                 action: #selector(languageButtonTapped),
                                 for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImagePlaceholder.clipsToBounds = true
        profileImagePlaceholder.clip(radius: profileImagePlaceholder.bounds.height/2)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = Theme.current.background
        profileImagePlaceholder.iconTintColor = Theme.current.supporting
        profileImagePlaceholder.selfBackgroundColor = Theme.current.supportingShade
        themeButton.profileOption(title: "Theme",
                                     image: UIImage(named: "theme"))
        languageButton.profileOption(title: "Language",
                                     image: UIImage(named: "language"))
    }
    
    @objc private func themeButtonTapped() {
        let vc = ThemeConfViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
    @objc private func languageButtonTapped() {
        let vc = LanguageConfViewController()
        navController?.pushViewController(vc, animated: true)
    }
    
}

