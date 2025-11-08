//
//  UIViewController+Alert.swift
//  week_03
//
//  Created by 조영서 on 11/8/25.
//

import UIKit

extension UIViewController {
    func showAlert(
        title: String,
        message: String,
        buttonTitle: String = "확인",
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
