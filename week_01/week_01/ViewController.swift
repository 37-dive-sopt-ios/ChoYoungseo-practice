//
//  ViewController.swift
//  week_01
//
//  Created by 조영서 on 10/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: - Lifecycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    private func setUI() {
        view.addSubview(testLabel)
        view.backgroundColor = .systemPink
    }
    
    private func setLayout() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
    }
}
