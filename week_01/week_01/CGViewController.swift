//
//  CGViewController.swift
//  week_01
//
//  Created by 조영서 on 10/11/25.
//

import UIKit

class CGViewController: UIViewController {
    
    private let boxView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(boxView)
    }
}
