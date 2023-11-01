//
//  InputFieldView.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 21/10/23.
//

import UIKit

enum InputFieldState {
    case common
    case phoneNumber
    
    var format: String {
        switch self {
        case .common:
            return String.empty
        case .phoneNumber:
            return "+XXX (XX) XXX-XX-XX"
        }
    }
    
    var prefix: String {
        switch self {
        case .common:
            String.empty
        case .phoneNumber:
            "+998"
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .common:
            return .asciiCapable
        case .phoneNumber:
            return .phonePad
        }
    }
}

class InputFieldView: BaseUIView {
    
    @IBOutlet weak var selfView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    private var image: UIImage?
    private var placeholderText: String?
    
    private var state: InputFieldState = .common {
        didSet {
            textField.keyboardType = state.keyboardType
        }
    }
    
    override func commonInit() {
        super.commonInit()
        addParent(customView: selfView)
        configure()
    }
    
    private func configure() {
        clearBackground()
        selfView.inactiveBorder()
        textField.delegate = self
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selfView.clip(radius: rect.height/4)
    }
    
    func set(image: UIImage?) {
        self.image = image
        imageView.image = image
    }
    
    func set(placeholder: String?) {
        self.placeholderText = placeholder
        textField.placeholder(with: placeholder.nonNil)
    }
    
    func set(state: InputFieldState) {
        self.state = state
    }
    
}

extension InputFieldView: ThemeModifiable {
    func configureColor() {
        selfView.inactiveBorder()
        imageView.tintColor = Theme.current.supporting
        selfView.backgroundColor = Theme.current.background
        textField.placeholder(with: placeholderText.nonNil)
        textField.text(font: .regular, size: 14, color: Theme.current.text)
        textField.set(keyboardAppearance: Theme.current)
    }
}

extension InputFieldView: UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        guard let text = textField.text,
              text.elementsEqual(state.prefix) else { return true  }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let text = textField.text, text.isEmpty else {
           return
        }
        if state == .phoneNumber {
            textField.text = state.prefix
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard state == .phoneNumber else { return true }
        guard let text = textField.text else { return false }
        if string.isEmpty && text.elementsEqual(state.prefix) { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: state.format, phone: newString)
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
    /// mask example: `+X (XXX) XXX-XXXX`
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
}
