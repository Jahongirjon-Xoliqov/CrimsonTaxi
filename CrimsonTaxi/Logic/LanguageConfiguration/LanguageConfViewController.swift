//
//  LanguageConfViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 27/10/23.
//

import UIKit

class LanguageConfViewController: BaseViewController {

    @IBOutlet weak var navTitleView: NavTitleView!
    
    @IBOutlet weak var uzButton: PrimaryButton!
    @IBOutlet weak var ruButton: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        navTitleView.enableBackButton(true)
        navTitleView.set(title: "Choose language")
        navTitleView.backTapAction = { [weak self] in
            guard let _ = self else { return }
            self?.navController?.popViewController(animated: true)
        }
        
        uzButton.set(title: "O'zbek")
        uzButton.tapAction = { [weak self] in
            guard let _ = self else { return }
            
        }
        
        ruButton.set(title: "Русский")
        ruButton.tapAction = { [weak self] in
            guard let _ = self else { return }
            
        }
        
    }

    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = Theme.current.background
    }

}
