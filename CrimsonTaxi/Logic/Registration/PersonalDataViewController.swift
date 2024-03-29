//
//  PersonalDataViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

class PersonalDataViewController: BaseViewController, FlowController {
    
    @IBOutlet weak var largeTitleLabel: UILabel!
    @IBOutlet weak var nameFieldView: InputFieldView!
    @IBOutlet weak var phoneFieldView: InputFieldView!
    @IBOutlet weak var nextButton: PrimaryButton!
    @IBOutlet weak var maleButton: SelectableView!
    @IBOutlet weak var femaleButton: SelectableView!
    
    var didFillDataAction: CommonAction?
    
    var completionHandler: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        
        nameFieldView.set(state: .common)
        nameFieldView.set(image: UIImage(named: "profile"))
        nameFieldView.set(placeholder: "Full Name")
        
        phoneFieldView.set(state: .phoneNumber)
        phoneFieldView.set(image: UIImage(named: "phone"))
        phoneFieldView.set(placeholder: "Contact Number")
        
        nextButton.set(title: "Next")
        nextButton.tapAction = { [weak self] in
            guard let self else { return }
            self.completionHandler?("Yes")
        }
        
        maleButton.set(title: "Male")
        maleButton.set(image: UIImage(named: "profile"))
        maleButton.becomeActiveAction = { [weak self] in
            guard let self else { return }
            self.maleButton.set(state: .seleted)
            self.femaleButton.set(state: .default)
        }
        
        femaleButton.set(title: "Female")
        femaleButton.set(image: UIImage(named: "female"))
        femaleButton.becomeActiveAction = { [weak self] in
            guard let self else { return }
            self.femaleButton.set(state: .seleted)
            self.maleButton.set(state: .default)
        }
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = Theme.current.background
        largeTitleLabel.attributedText = Attr.create(text: "Enter Your\nPersonal Details",
                                                     color: Theme.current.text,
                                                     font: .extrabold,
                                                     size: 32, 
                                                     align: .left)
                                        .replace(text: "Personal Details",
                                                 color: Theme.current.primary,
                                                 font: .extrabold,
                                                 size: 32,
                                                 align: .left)
    }
    
}

