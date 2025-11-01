//
//  LoginView.swift
//  week_03
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private(set) var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        textField.clearButtonMode = .whileEditing
        textField.setPadding(10)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.setPadding(10)
        return textField
    }()
    
    private(set) lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        addSubviews(titleLabel, idTextField, passwordTextField, loginButton)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).offset(116)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
    }
    
    // MARK: - Public Method
    
    public func retryLogin(didTapReloginWith message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}
