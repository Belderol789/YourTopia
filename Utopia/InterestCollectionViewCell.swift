//
//  InterestCollectionViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 11/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var nextTopicButton: UIButton!
    @IBOutlet weak var backTopicButton: UIButton!
    
    
    static let cellIdentifier = "InterestCollectionViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
