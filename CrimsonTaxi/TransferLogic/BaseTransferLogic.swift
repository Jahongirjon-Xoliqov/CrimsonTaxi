//
//  BaseTransferLogic.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 11/02/24.
//

import Foundation

final class TransferData {
    var transferCommissionPercent: Decimal?
    var transferCashbackPercent: Decimal?
    var premiumTransferCommissionPercent: Decimal?
    var premiumTransferCashbackPercent: Decimal?
}

final class CardModel {
    var balance: Decimal?
}


class BaseTransferLogic {
    
    /// transfer commission percent -> 15% is represented as 0.15
    func getTransferCommissionAmount(transferAmount: Decimal, commissionPercent: Decimal) -> Decimal {
        transferAmount * commissionPercent
    }
    
    /// transfer cashback percent -> 15% is represented as 0.15
    func getTransferCashbackAmount(transferAmount: Decimal, cashbackPercent: Decimal) -> Decimal {
        transferAmount * cashbackPercent
    }

    func getRequiredMinimumTransferAmount(cardBalance: Decimal, minimumSendableAmount: Decimal, minimumReceivableAmount: Decimal) -> Decimal {
        max(cardBalance, max(minimumSendableAmount, minimumReceivableAmount))
    }
    
    func getRequiredMaximumTransferAmount(maximumTransferrableAmount: Decimal, maximumSendableAmount: Decimal, maximumReceivableAmount: Decimal) -> Decimal {
        min(maximumTransferrableAmount, min(maximumSendableAmount, maximumReceivableAmount))
    }
    
    /// commission percent -> 15% is in form 0.15
    func getMaximumTransferrableAmount(cardBalance: Decimal, commissionPercent: Decimal) -> Decimal {
        cardBalance - cardBalance * commissionPercent
    }
    
    func convertFromUSDToUZS(transferAmount: Decimal, currencyRate: Decimal) -> Decimal {
        transferAmount * currencyRate
    }
    
    func convertFromUZSToUSD(transferAmount: Decimal, currencyRate: Decimal) -> Decimal {
        transferAmount / currencyRate
    }
    
}


struct TransferCalculator {
    
}
