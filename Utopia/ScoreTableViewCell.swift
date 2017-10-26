//
//  ScoreTableViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 17/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicLabel: UILabelX!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    static let cellIdentifier = "ScoreTableViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)

    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
