//
//  ScrollViewController.swift
//  week_02
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit

final class ScrollViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redBox: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeBox: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellowBox: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenBox: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueBox: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let purpleBox: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redBox, orangeBox, yellowBox, greenBox, blueBox, purpleBox)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        redBox.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(300)
        }
        
        orangeBox.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(redBox.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(300)
        }
        
        yellowBox.snp.makeConstraints {
            $0.top.equalTo(redBox.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(300)
        }
        
        greenBox.snp.makeConstraints {
            $0.top.equalTo(orangeBox.snp.bottom)
            $0.leading.equalTo(yellowBox.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(300)
        }
        
        blueBox.snp.makeConstraints {
            $0.top.equalTo(yellowBox.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(300)
        }
        
        purpleBox.snp.makeConstraints {
            $0.top.equalTo(greenBox.snp.bottom)
            $0.leading.equalTo(blueBox.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview()
        }
    }
}
