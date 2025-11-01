//
//  FeedCollectionViewCell.swift
//  week_03
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit
import Then

protocol FeedCollectionViewCellDelegate: AnyObject {
    func didTapLikeButton(_ cell: FeedCollectionViewCell)
}

final class FeedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeedCollectionViewCell"
    
    weak var delegate: FeedCollectionViewCellDelegate?
    
    // MARK: - UI Components
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private lazy var likeButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_heart_gray"), for: .normal)
        $0.setImage(UIImage(named: "ic_heart_red"), for: .selected)
        $0.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    private let feedStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 2
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .pretendard(.subhead2)
    }
    
    private let priceLabel = UILabel().then {
        $0.textColor = .primaryOrange
        $0.font = .pretendard(.subhead3)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    
    private func setLayout() {
        feedStackView.addArrangedSubviews(titleLabel, priceLabel)
        contentView.addSubviews(productImageView, likeButton, feedStackView)
        
        productImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(9)
            $0.height.equalTo(139)
        }
        
        likeButton.snp.makeConstraints {
            $0.bottom.equalTo(productImageView.snp.bottom).offset(-8)
            $0.trailing.equalTo(productImageView.snp.trailing).offset(-8)
            $0.size.equalTo(20)
        }
        
        feedStackView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(13)
            $0.trailing.lessThanOrEqualToSuperview().inset(13)
            $0.bottom.lessThanOrEqualToSuperview().inset(8)
        }
    }
    
    // MARK: - Actions
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
        delegate?.didTapLikeButton(self)
    }
    
    // MARK: - Configuration
    
    func configure(feed: FeedModel) {
        productImageView.image = feed.itemImg
        titleLabel.text = feed.name
        priceLabel.text = feed.price
        likeButton.isSelected = feed.isLiked
    }
}
