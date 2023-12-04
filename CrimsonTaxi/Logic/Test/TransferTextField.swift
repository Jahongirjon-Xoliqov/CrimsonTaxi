//
//  TransferTextField.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 01/12/23.
//

import UIKit

final class TransferTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.roundingMode = .floor
        return formatter
    }()
    
    var amount: NSNumber? {
        guard let amount = text else { return nil }
        return formatter.number(from: amount)
    }
    
    var formattedAmount: String? {
        guard let amount else { return nil }
        return formatter.string(from: amount)
    }
    
    var amountDouble: Double? {
        guard let amount else { return nil }
        return amount.doubleValue
    }
    
    private (set) var currency: String?
    
    private func commonInit() {
        borderStyle = .none
        textColor = .black
        textAlignment = .left
        textContentType = .creditCardNumber
        keyboardType = .numberPad
        keyboardAppearance = .dark
    }
    
    func set(currency: String?) {
        self.currency = currency
    }
    
    func set(formatter: NumberFormatter) {
        self.formatter = formatter
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        false
    }
    
}
