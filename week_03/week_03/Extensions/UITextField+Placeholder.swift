//
//  UITextField+Placeholder.swift
//  week_03
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

extension UITextField {
    
    func setPlaceholder(_ text: String, color: UIColor, font: UIFont? = nil) {
        var attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        
        if let font = font {
            attributes[.font] = font
        }
        
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
}
