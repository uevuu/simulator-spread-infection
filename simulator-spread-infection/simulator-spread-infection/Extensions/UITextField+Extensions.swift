//
//  UITextField+Extensions.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

extension UITextField {
    func numericValue(defaultValue: Int) -> Int {
        guard let text = self.text else { return defaultValue }
        if let intValue = Int(text) {
            return intValue
        } else {
            return defaultValue
        }
    }
}
