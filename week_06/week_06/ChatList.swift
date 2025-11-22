//
//  ChatList.swift
//  week_06
//
//  Created by 조영서 on 11/22/25.
//

import SwiftUI

struct ChatList: View {
    let chatRooms: [ChatRoomModel]

    var body: some View {
        List(chatRooms) { chatRoom in
            ChatRow(chatRoom: chatRoom)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ChatList(chatRooms: ChatRoomModel.mockData)
}
