//
//  WelcomeViewController_Closure.swift
//  week_03
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

final class WelcomeViewController_Closure: UIViewController {
    
    // MARK: - Properties
    
    var id: String?
    var completionHandler: ((String) -> Void)?
    
    
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
    
    private let goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let backToLoginButton: UIButton = {
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
    
    
    // MARK: - Actions
    
    @objc
    private func backToLoginButtonDidTap() {
        let nickname = id ?? "당근당근"
        completionHandler?("\(nickname)님이 다시 로그인 버튼을 눌렀어요!")
        
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

    
    // MARK: - Private Methods
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func bindID() {
        if let idText = id, !idText.isEmpty {
            welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            welcomeLabel.text = "뿅 ㅋㅋ"
        }
    }
}
