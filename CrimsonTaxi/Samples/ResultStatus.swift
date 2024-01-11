//
//  ResultStatus.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 11/01/24.
//

import Foundation

class TransactionAction {
    var title: String
    var icon: String
    var action: (() -> Void)?
    init(title: String, icon: String, action: (() -> Void)? = nil) {
        self.title = title
        self.icon = icon
        self.action = action
    }
}

protocol TransactionResultActionProtocol {
    var icon: String { get set }
    var status: String { get set }
    var statusDescription: String? { get set }
    var subactions: [TransactionAction]? { get set }
}

final class TransferResultAction: TransactionResultActionProtocol {
    var icon: String
    var status: String
    var statusDescription: String?
    var subactions: [TransactionAction]?
    
    init(icon: String, status: String, statusDescription: String? = nil, subactions: [TransactionAction]? = nil) {
        self.icon = icon
        self.status = status
        self.statusDescription = statusDescription
        self.subactions = subactions
    }
}

final class PaymentResultAction: TransactionResultActionProtocol {
    var icon: String
    var status: String
    var statusDescription: String?
    var subactions: [TransactionAction]?
    
    init(icon: String, status: String, statusDescription: String? = nil, subactions: [TransactionAction]? = nil) {
        self.icon = icon
        self.status = status
        self.statusDescription = statusDescription
        self.subactions = subactions
    }
}
