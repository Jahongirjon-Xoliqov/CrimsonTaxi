//
//  BaseViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 18/10/23.
//

import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Theme.settings.add(self)
    }
    deinit {
        Theme.settings.remove(self)
    }
    func configureAppearance() {}
}

extension BaseViewController: ThemeModifiable {
    func updateTheme() {
        configureAppearance()
    }
}
