//
//  UIFont+.swift
//  week_03
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

extension UIFont {
    enum PretendardStyle {
        case head1
        case subhead1
        case subhead2
        case subhead3
        case subhead4
        case subhead5
        case info12
    }

    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .head1:
            return UIFont(name: "Pretendard-Bold", size: 25) ?? .systemFont(ofSize: 25, weight: .bold)
        case .subhead1:
            return UIFont(name: "Pretendard-Bold", size: 18) ?? .systemFont(ofSize: 18, weight: .bold)
        case .subhead2:
            return UIFont(name: "Pretendard-Regular", size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
        case .subhead3:
            return UIFont(name: "Pretendard-Bold", size: 15) ?? .systemFont(ofSize: 15, weight: .regular)
        case .subhead4:
            return UIFont(name: "Pretendard-SemiBold", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        case .subhead5:
            return UIFont(name: "Pretendard-Regular", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        case .info12:
            return UIFont(name: "Pretendard-Regular", size: 12) ?? .systemFont(ofSize: 12, weight: .regular)
        }
    }
}
