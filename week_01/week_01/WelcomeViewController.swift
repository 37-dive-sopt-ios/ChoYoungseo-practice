//
//  WelcomeViewController.swift
//  week_01
//
//  Created by 조영서 on 10/11/25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var id: String?
    
    // MARK: - UI Components
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 90, width: 150, height: 150))
        imageView.image = UIImage(named: "character_profile")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.font = UIFont(name: "Pretendard-Bold", size: 25)
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
        button.setTitleColor(.grey400, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true //상단에 표시되는 기본 네비게이션 바의 뒤로가기 버튼을 숨기는 속성입니다!
        view.backgroundColor = .white
        setLayout()
        bindID()
        backToLoginButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        goHomeButton.addTarget(self, action: #selector(goHomeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Setup Methods
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Private Methods
    
    private func bindID() {
        if let idText = id, !idText.isEmpty {
            welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            welcomeLabel.text = "뿅ㅋㅋ"
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func backToLoginButtonDidTap() {
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    private func goHomeButtonDidTap() { }
}

#Preview {
    WelcomeViewController()
}
