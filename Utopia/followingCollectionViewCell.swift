//
//  followingCollectionViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 12/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class followingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var colorView: UIViewX!
    
    static let cellIdentifier = "followingCollectionViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

}
