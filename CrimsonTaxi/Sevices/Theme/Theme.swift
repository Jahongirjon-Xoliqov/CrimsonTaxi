//
//  Theme.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 20/10/23.
//

import UIKit

protocol Weakable: AnyObject { }

class Weak<T: Weakable> {
    private (set) weak var value: T?
    var isNil: Bool {
        return self.value == nil
    }
    init(value: T?) {
        self.value = value
    }
}

protocol ThemeModifiable: Weakable {
    func updateTheme()
    func configureColor()
}

extension ThemeModifiable {
    func updateTheme() {}
    func configureColor() {}
}

final class Theme {
    
    static let settings: Theme = {
        let theme = Theme()
        return theme
    }()
    
    static var current: Themeable = {
        let themeIndex = Cache.theme
        let formatter = ThemeFormatter()
        let theme = formatter.convert(themeIndex)
        return theme
    }()
    
    fileprivate struct ThemeFormatter {
        func convert(_ index: Int) -> Themeable {
            switch index {
            case 0: LightTheme()
            case 1: DarkTheme()
            case 2: CrimsonTheme()
            default: LightTheme()
            }
        }
    }
    
    private init() {}
    
    fileprivate var themeables: [Weak<BaseViewController>] = []
    
    func updateTheme(_ theme: Themeable) {
        Self.current = theme
        self.themeables = self.themeables.filter { !$0.isNil }
        for themeable in themeables {
            themeable.value?.updateTheme()
        }
    }
    
    func add(_ themeable: BaseViewController, forceUpdate: Bool = false) {
        self.themeables = self.themeables.filter { !$0.isNil }
        self.themeables.append(Weak(value: themeable))
        if forceUpdate {
            themeable.updateTheme()
        }
    }
    
    func remove(_ themeable: UIViewController) {
        self.themeables = self.themeables.filter {
            $0.value?.isEqual(themeable) == false
        }
    }
    
}

