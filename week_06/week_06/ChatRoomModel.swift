//
//  ChatRoomModel.swift
//  week_06
//
//  Created by 조영서 on 11/22/25.
//

import SwiftUI

struct ChatRoomModel: Identifiable {
    let id = UUID()
    let profileImage: Image?
    let name: String
    let location: String
    let lastMessage: String
    let thumbnail: Image?
}

// MARK: - Mock Data

extension ChatRoomModel {
    static let mockData: [ChatRoomModel] = [
        ChatRoomModel(
            profileImage: nil,
            name: "조영서",
            location: "창전동",
            lastMessage: "^ↀᴥↀ^",
            thumbnail: Image(.imgGanadi1)
        ),
        ChatRoomModel(
            profileImage: Image(.imgUser),
            name: "차은우",
            location: "구의동",
            lastMessage: "넘 수고하세용",
            thumbnail: Image(.imgGanadi2)
        ),
        ChatRoomModel(
            profileImage: Image(.imgUser),
            name: "마틴",
            location: "부문동2가",
            lastMessage: "안녕하세요 코르티스입니다!!!",
            thumbnail: Image(.imgGanadi3)
        ),
        ChatRoomModel(
            profileImage: nil,
            name: "제임스",
            location: "면목동",
            lastMessage: "저는 제임스에여 ㅎ",
            thumbnail: Image(.imgGanadi4)
        ),
        ChatRoomModel(
            profileImage: Image(.imgGanadi5),
            name: "안건호",
            location: "자양제4동",
            lastMessage: "네.",
            thumbnail: Image(.imgGanadi6)
        ),
        ChatRoomModel(
            profileImage: Image(.imgUser),
            name: "닝닝",
            location: "옥수동",
            lastMessage: "안냐세여~~",
            thumbnail: Image(.imgGanadi7)
        ),
        ChatRoomModel(
            profileImage: Image(.imgUser),
            name: "공뇽",
            location: "면목동",
            lastMessage: "공뇽님이 이모티콘을 보냈어요.",
            thumbnail: Image(.imgGanadi1)
        )
    ]
}
