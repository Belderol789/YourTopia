//
//  FeedImageTableViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 11/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class FeedImageTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "FeedImageTableViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)
    @IBOutlet weak var postText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        postText.sizeToFit()
//        postText.numberOfLines = 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
