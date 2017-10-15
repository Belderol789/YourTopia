//
//  ChatVC.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 15/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var chatTable: UITableView!{
        didSet{
            chatTable.register(ChatTableViewCell.cellNib, forCellReuseIdentifier: ChatTableViewCell.cellIdentifier)
            chatTable.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTable.delegate = self
        chatTable.dataSource = self
        chatTable.backgroundColor = UIColor.black.withAlphaComponent(0.5)

    }

}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.cellIdentifier, for: indexPath) as? ChatTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
