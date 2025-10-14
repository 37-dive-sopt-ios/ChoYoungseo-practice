//
//  PracticeController.swift
//  week_01
//
//  Created by 조영서 on 10/11/25.
//

import UIKit

final class PracticeController: UIViewController {
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: self.view.bounds.width - 40, height: 40))
        label.text = "배달의민족"
        label.font = UIFont(name: "Pretendard-Bold", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 165, width: self.view.bounds.width - 40, height: 20))
        label.text = "지금 맛있는 여정을 시작해보세요!"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 220, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "이메일 아이디"
        textField.font = UIFont(name: "Pretendard-Regular", size: 15)
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.baeminLightGray
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "Grey300")?.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 275, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-Regular", size: 15)
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor.baeminLightGray
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "Grey300")?.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 340, width: self.view.bounds.width - 40, height: 50))
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.backgroundColor = .baeminSkyBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var socialLoginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 460, width: self.view.bounds.width - 40, height: 20))
        label.text = "또는"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var naverLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - 120, y: 440, width: 100, height: 50))
        button.setTitle(" 네이버", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "n.square.fill"), for: .normal)
        button.tintColor = .systemGreen
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "Grey300")?.cgColor
        return button
    }()
    
    lazy var kakaoLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.bounds.width / 2 + 20, y: 440, width: 100, height: 50))
        button.setTitle(" 카카오", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "k.square.fill"), for: .normal)
        button.tintColor = .systemYellow
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "Grey300")?.cgColor
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
    }
    
    // MARK: - Setup Methods
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            titleLabel,
            subtitleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            socialLoginLabel,
            naverLoginButton,
            kakaoLoginButton
        ]
        components.forEach { view.addSubview($0) }
    }
}

#Preview {
    PracticeController()
}
