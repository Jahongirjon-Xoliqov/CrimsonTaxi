//
//  Cache.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import Foundation

final class Cache {
    private static let cache = UserDefaults.standard
    enum TypeKey: String {
        //use kebab case
        case appTheme = "app-theme"
    }
    static var theme: Int {
        get { cache.integer(forKey: TypeKey.appTheme.rawValue) }
        set { cache.set(newValue, forKey: TypeKey.appTheme.rawValue)}
    }
}
