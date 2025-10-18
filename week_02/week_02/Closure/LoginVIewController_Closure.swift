//
//  LoginViewController_Closure.swift
//  week_02
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

final class LoginViewController_Closure: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .grey200
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 3
        textField.setPadding(10)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.setPadding(10)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Navigation
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController_Closure()
        welcomeVC.id = idTextField.text
        
        // completionHandler 설정
        welcomeVC.completionHandler = { [weak self] message in
            self?.handleCompletion(message: message)
        }
        
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    // MARK: - Actions
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
        
    private func handleCompletion(message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}
