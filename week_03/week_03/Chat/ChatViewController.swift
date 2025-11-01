//
//  ChatViewController.swift
//  week_03
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var chatRooms: [ChatRoomModel] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
    }
    
    // MARK: - Setup Methods
    
    private func setUI() {
        view.backgroundColor = .white
        title = "채팅"
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        chatRooms = ChatRoomModel.mockData
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatRoom = chatRooms[indexPath.row]
        print("\(chatRoom.name) 채팅방 선택됨")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath
        ) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        let chatRoom = chatRooms[indexPath.row]
        cell.configure(chatRoom: chatRoom)
        return cell
    }
}
