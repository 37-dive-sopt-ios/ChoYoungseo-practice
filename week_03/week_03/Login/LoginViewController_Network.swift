//
//  LoginViewController_Network.swift
//  week_03
//
//  Created by 조영서 on 11/8/25.
//

import UIKit
import SnapKit
import Then

public final class LoginViewController_Network: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "4차 세미나"
        $0.font = UIFont(name: "Pretendard-Bold", size: 25)
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.textColor = .black
    }
    
    private let usernameTextField = UITextField().then {
        $0.placeholder = "Username (예: johndoe)"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.borderStyle = .roundedRect
        $0.autocapitalizationType = .none
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "Password (예: P@ssw0rd!)"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.borderStyle = .roundedRect
//        $0.isSecureTextEntry = true
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "이름 (예: 홍길동)"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.borderStyle = .roundedRect
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "Email (예: hong@example.com)"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.borderStyle = .roundedRect
        $0.keyboardType = .emailAddress
        $0.autocapitalizationType = .none
    }
    
    private let ageTextField = UITextField().then {
        $0.placeholder = "나이 (예: 25)"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    
    private lazy var registerButton = UIButton(type: .system).then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .baeminSkyBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private lazy var loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .baeminSkyBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Properties
    
    private let provider: NetworkProviding
    
    // MARK: - Init
    
    public init(provider: NetworkProviding = NetworkProvider()) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    private func setLayout() {
        view.addSubviews(
            titleLabel,
            usernameTextField,
            passwordTextField,
            nameTextField,
            emailTextField,
            ageTextField,
            registerButton,
            loginButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
    }
    
    // MARK: - Actions
    
    @objc private func registerButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText)
        else {
            showAlert(title: "입력 오류", message: "모든 필드를 올바르게 입력해주세요.")
            return
        }
        
        Task {
            await performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age
            )
        }
    }
    
    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "입력 오류", message: "아이디와 비밀번호를 입력해주세요.")
            return
        }
        
        Task {
            await performLogin(username: username, password: password)
        }
    }
    
    // MARK: - API Calls
    
    @MainActor
    private func performRegister(
        username: String,
        password: String,
        name: String,
        email: String,
        age: Int
    ) async {
        do {
            let response = try await UserAPI.performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age,
                provider: provider
            )
            
            showAlert(title: "회원가입 성공", message: "회원가입이 완료되었습니다!") { [weak self] in
                self?.navigateToWelcome(userId: response.id, userName: response.name)
            }
        } catch let error as NetworkError {
            print("🚨 [Register Error] \(error.detailedDescription)")
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        }
    }
    
    @MainActor
    private func performLogin(username: String, password: String) async {
        do {
            let response = try await UserAPI.performLogin(
                username: username,
                password: password,
                provider: provider
            )
            
            showAlert(title: "로그인 성공", message: response.message) { [weak self] in
                self?.navigateToWelcome(userId: response.userId, userName: username)
            }
        } catch let error as NetworkError {
            print("🚨 [Login Error] \(error.detailedDescription)")
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Login Unknown Error] \(error)")
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        }
    }
    
    // MARK: - Navigation
    
    private func navigateToWelcome(userId: Int, userName: String) {
        let welcomeVC = WelcomeViewController_Network()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}
