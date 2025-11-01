//
//  WelcomeViewController_Delegate.swift
//  week_03
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

protocol WelcomeReloginDelegate: AnyObject {
    func retryLogin(didTapReloginWith message: String)
}

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: WelcomeReloginDelegate?
    var id: String?
    
    // MARK: - UI Components
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "img_karrot_charcter")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        
        setLayout()
        bindID()
        
        backToLoginButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        goHomeButton.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    
    private func setLayout() {
        
        view.addSubviews(logoImageView, welcomeLabel, goHomeButton, backToLoginButton)
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        goHomeButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(17)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.top.equalTo(goHomeButton.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
    }
    
    private func bindID() {
        if let idText = id, !idText.isEmpty {
            welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            welcomeLabel.text = "뿅 ㅋㅋ"
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func backToLoginButtonDidTap() {
        delegate?.retryLogin(didTapReloginWith: "다시 로그인 버튼이 눌렸습니다.")
        
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    private func goHomeButtonDidTap() {
        // 홈 화면 이동 로직
    }
}
