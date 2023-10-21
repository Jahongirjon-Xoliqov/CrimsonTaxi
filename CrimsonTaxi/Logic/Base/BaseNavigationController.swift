//
//  BaseNavigationController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    private lazy var titleLabel: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private lazy var backButton: NavBackButton = {
        let button = NavBackButton(frame: .zero)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        navigationItem.title = ""
        navigationBar.isHidden = true
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
    }
    
    func set(title: String) {
        titleLabel.text = title
        titleLabel.textColor = Theme.current.text
        titleLabel.font = Font.semibold.size(17)
        titleLabel.textAlignment = .center
    }
    
    func setBackButton(action: CommonAction? = nil) {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        backButton.tapAction = { [weak self] in
            guard let self else { return }
            action?()
        }
        
    }
    
}
