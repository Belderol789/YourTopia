//
//  ProfileFeed.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 13/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class ProfileFeed: UIView {
    
    let green = UIColor(red: 0/255, green: 180/255, blue: 0/255, alpha: 1)
    let blue = UIColor(red: 0/255, green: 0/255, blue: 180/255, alpha: 1)
    var fakeData: [String] = ["Science", "Anime", "Food", "Videogames", "Sports", "News"]
    var fakeColors: [UIColor] = []
    var feedTableView: FeedTableView = FeedTableView()
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(followingCollectionViewCell.cellNib, forCellWithReuseIdentifier: followingCollectionViewCell.cellIdentifier)
            collectionView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(FeedImageTableViewCell.cellNib, forCellReuseIdentifier: FeedImageTableViewCell.cellIdentifier)
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        fakeColors = [self.blue, self.green, .red, .orange, .purple, .gray]
        setupDelegates()
        
    }

    func setupDelegates() {
        tableView.delegate = feedTableView
        tableView.dataSource = feedTableView
        tableView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
   

}

extension ProfileFeed: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: followingCollectionViewCell.cellIdentifier, for: indexPath) as? followingCollectionViewCell else {return UICollectionViewCell()}
        let interestTitle = fakeData[indexPath.item]
        //let fakeColor = fakeColors[indexPath.item]
        
        cell.button.setTitle(interestTitle, for: .normal)
        cell.button.titleLabel?.adjustsFontSizeToFitWidth = true
        //cell.colorView.backgroundColor = fakeColor
        cell.contentView.backgroundColor = .clear
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = 90
        let itemHeight = collectionView.bounds.height
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
