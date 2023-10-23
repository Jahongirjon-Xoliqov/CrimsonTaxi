//
//  AppThemes.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 21/10/23.
//

import UIKit

protocol Themeable: AnyObject {
    var primary: UIColor { get }
    var secondary: UIColor { get }
    var text: UIColor { get }
    var background: UIColor { get }
    var supporting: UIColor { get }
    var error: UIColor { get }
    var navigationControl: UIColor { get }
    var supportingBacground: UIColor { get }
}

final class LightTheme: Themeable {
    var primary: UIColor = UIColor(red: 250, green: 146, blue: 17)
    var secondary: UIColor = UIColor(red: 16, green: 24, blue: 46)
    var text: UIColor = UIColor(red: 0, green: 0, blue: 0)
    var background: UIColor = UIColor(red: 255, green: 255, blue: 255)
    var supporting: UIColor = UIColor(red: 146, green: 146, blue: 146)
    var error: UIColor = UIColor(red: 255, green: 0, blue: 0)
    var navigationControl: UIColor = UIColor(red: 16, green: 24, blue: 46)
    var supportingBacground: UIColor = UIColor(red: 255, green: 255, blue: 255)
}

final class DarkTheme: Themeable {
    var primary: UIColor = UIColor(red: 250, green: 146, blue: 17)
    var secondary: UIColor = UIColor(red: 250, green: 146, blue: 17)
    var text: UIColor = UIColor(red: 255, green: 255, blue: 255)
    var background: UIColor = UIColor(red: 19, green: 20, blue: 24)
    var supporting: UIColor = UIColor(red: 255, green: 255, blue: 255)
    var error: UIColor = UIColor(red: 255, green: 0, blue: 0)
    var navigationControl: UIColor = UIColor(red: 250, green: 146, blue: 17)
    var supportingBacground: UIColor = UIColor(red: 46, green: 46, blue: 46)
}

final class CrimsonTheme: Themeable {
    var primary: UIColor = UIColor(rgb: 0xfca311)
    var secondary: UIColor = UIColor(rgb: 0x14217d)
    var text: UIColor = UIColor(rgb: 0x00)
    var background: UIColor = UIColor(rgb: 0xff)
    var supporting: UIColor = UIColor(rgb: 0x515151)
    var error: UIColor = UIColor(rgb: 0xFF0000)
    var navigationControl: UIColor = UIColor(rgb: 0xFF0000)
    var supportingBacground: UIColor = UIColor(rgb: 0xFF0000)
}
