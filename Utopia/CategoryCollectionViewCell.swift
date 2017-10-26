//
//  CategoryCollectionViewCell.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 16/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CategoryCollectionViewCell"
    static let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)
    @IBOutlet weak var imageView: UIImageViewX!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.circularImageView()
       
    }

}
