//
//  ChatTableViewCell.swift
//  week_03
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit
import Then

final class ChatTableViewCell: UITableViewCell {
    
    static let identifier: String = "ChatTableViewCell"
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage()
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let titleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .pretendard(.subhead3)
    }
    
    private let locationLabel = UILabel().then {
        $0.textColor = .grey400
        $0.font = .pretendard(.info12)
    }
    
    private let contextStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 4
    }
    
    private let messageLabel = UILabel().then {
        $0.textColor = .black
        $0.numberOfLines = 1
        $0.font = .pretendard(.subhead5)
    }
    
    private let productImageView = UIImageView().then {
        $0.image = UIImage()
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    
    private func setLayout() {
        titleStackView.addArrangedSubviews(nameLabel, locationLabel)
        contextStackView.addArrangedSubviews(titleStackView, messageLabel)

        contentView.addSubviews(profileImageView, contextStackView, productImageView)
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        contextStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
            $0.height.equalTo(40)
            $0.width.equalTo(230)
            $0.centerY.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
}

// MARK: - Extension

extension ChatTableViewCell {
    func configure(chatRoom: ChatRoomModel) {
        profileImageView.image = chatRoom.profileImage
        nameLabel.text = chatRoom.name
        locationLabel.text = chatRoom.location
        messageLabel.text = chatRoom.lastMessage
        productImageView.image = chatRoom.productImage
    }
}
