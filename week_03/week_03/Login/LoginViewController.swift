//
//  LoginViewController.swift
//  week_03
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let loginView = LoginView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    // MARK: - Setup
    
    private func setAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Navigation

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = loginView.idTextField.text
        welcomeViewController.delegate = self
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // MARK: - Actions
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
}

// MARK: - Extensions

extension LoginViewController: WelcomeReloginDelegate {
    func retryLogin(didTapReloginWith message: String) {
        loginView.retryLogin(didTapReloginWith: message)
    }
}
