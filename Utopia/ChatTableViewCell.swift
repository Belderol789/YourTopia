//
//  ChatTableViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 15/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "ChatTableViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
