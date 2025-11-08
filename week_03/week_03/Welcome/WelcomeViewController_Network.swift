//
//  WelcomeViewController_Network.swift
//  week_03
//
//  Created by 조영서 on 11/8/25.
//

import UIKit
import SnapKit
import Then

// MARK: - WelcomeViewController_Network

public final class WelcomeViewController_Network: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "환영합니다!"
        $0.font = UIFont(name: "Pretendard-Bold", size: 25)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private lazy var getUserButton = createButton(
        title: "유저 조회 (GET /api/v1/users)",
        color: .systemBlue
    ).then {
        $0.addTarget(self, action: #selector(getUserButtonTapped), for: .touchUpInside)
    }
    
    private lazy var updateUserButton = createButton(
        title: "유저 수정 (PATCH /api/v1/users)",
        color: .systemOrange
    ).then {
        $0.addTarget(self, action: #selector(updateUserButtonTapped), for: .touchUpInside)
    }
    
    private lazy var deleteUserButton = createButton(
        title: "유저 삭제 (DELETE /api/v1/users)",
        color: .systemRed
    ).then {
        $0.addTarget(self, action: #selector(deleteUserButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Init
    
    public init() {
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
            getUserButton,
            updateUserButton,
            deleteUserButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        getUserButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        updateUserButton.snp.makeConstraints {
            $0.top.equalTo(getUserButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        deleteUserButton.snp.makeConstraints {
            $0.top.equalTo(updateUserButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
    }
    
    // MARK: - Actions
    
    @objc private func getUserButtonTapped() {
        // TODO: 유저 조회 API 연결
        showAlert(title: "유저 조회", message: "유저 정보를 불러옵니다.")
    }

    @objc private func updateUserButtonTapped() {
        // TODO: 유저 수정 API 연결
        showAlert(title: "유저 수정", message: "유저 정보를 수정합니다.")
    }
    
    @objc private func deleteUserButtonTapped() {
        showDeleteConfirmation()
    }
    
    // MARK: - Private Methods
    
    private func createButton(title: String, color: UIColor) -> UIButton {
        UIButton(type: .system).then {
            $0.setTitle(title, for: .normal)
            $0.backgroundColor = color
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.titleLabel?.numberOfLines = 2
            $0.titleLabel?.textAlignment = .center
            $0.layer.cornerRadius = 8
        }
    }
    
    private func showDeleteConfirmation() {
        showAlert(title: "유저 삭제", message: "정말로 삭제하시겠습니까?") {
            print("✅ 삭제 확인됨")
        }
    }
}
