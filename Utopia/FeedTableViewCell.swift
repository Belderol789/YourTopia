//
//  FeedTableViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 11/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "FeedTableViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
