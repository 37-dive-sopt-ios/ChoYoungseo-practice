//
//  LoginViewController.swift
//  week_01
//
//  Created by 조영서 on 10/11/25.
//

import UIKit

final class LoginViewController: UIViewController {
    
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
        textField.font = UIFont(name: "Pretendard-Regular", size: 16)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 6
        textField.clearButtonMode = .whileEditing   // 입력 중 X버튼 표시하는 속성입니다.
        textField.setPadding(10) // 텍스트필드에 패딩 넣을 일이 많아서, 편하게 쓰려고 Extension으로 따로 빼뒀어요!
      
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-Regular", size: 16)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 6
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.setPadding(10)
        
        return textField
    }()
    
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 52))
        button.backgroundColor = .grey300
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
        
        [idTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    // MARK: - Setup Methods
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Navigation
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // MARK: - Actions
    
    @objc
    private func textFieldDidChange() {
        let isEnabled = !(idTextField.text?.isEmpty ?? true) && !(passwordTextField.text?.isEmpty ?? true)
        loginButton.isEnabled = isEnabled
        loginButton.backgroundColor = isEnabled ? .primaryOrange : .grey300
    }
    
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
}
