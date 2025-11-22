//
//  ChatListView.swift
//  week_06
//
//  Created by 조영서 on 11/22/25.
//

import SwiftUI

struct ChatRow: View {
    
    let chatRoom: ChatRoomModel 

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            if let profileImage = chatRoom.profileImage {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                    .frame(width: 40, height: 40)
            } else {
                Image(.imgUser)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                    .frame(width: 40, height: 40)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(chatRoom.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(chatRoom.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(chatRoom.lastMessage)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if let thumbnail = chatRoom.thumbnail {
                thumbnail
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(4)
            }
        }
        .padding(16)
        .background(Color.white)
    }
}

//#Preview {
//    ChatRow()
//}
