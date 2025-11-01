//
//  FeedModel.swift
//  week_03
//
//  Created by 조영서 on 11/1/25.
//

import UIKit

struct FeedModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var isLiked: Bool
    
    init(itemImg: UIImage, name: String, price: String, isLiked: Bool) {
        self.itemImg = itemImg
        self.name = name
        self.price = price
        self.isLiked = isLiked
    }
    
    static let mockData: [FeedModel] = [
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_1") ?? UIImage(), name: "아이폰17PRO MAX", price: "1,990,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_2") ?? UIImage(), name: "airPod PRO 3", price: "330,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_3") ?? UIImage(), name: "커피머신", price: "100,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_4") ?? UIImage(), name: "샌드위치", price: "8,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_5") ?? UIImage(), name: "명품 핸수", price: "250,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_6") ?? UIImage(), name: "아이폰 16프로맥스", price: "1,000,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_7") ?? UIImage(), name: "에어팟 프로", price: "300,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_8") ?? UIImage(), name: "커피머신", price: "100,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_9") ?? UIImage(), name: "샌드위치", price: "8,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_10") ?? UIImage(), name: "명품 핸수", price: "250,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_1") ?? UIImage(), name: "아이패드 PRO", price: "1,400,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_2") ?? UIImage(), name: "airPod PRO 2", price: "330,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_3") ?? UIImage(), name: "마우스", price: "100,000원", isLiked: false),
        FeedModel(itemImg: UIImage(named: "img_sub_ product_dummy_4") ?? UIImage(), name: "아 배고파", price: "8,000원", isLiked: false)
    ]
}
