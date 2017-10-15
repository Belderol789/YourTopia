//
//  FeedTableView.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 12/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit


class FeedTableView: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var numberOfRows: Int = 5
    var heightOfRow: CGFloat = 335
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedImageTableViewCell.cellIdentifier, for: indexPath) as? FeedImageTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
}

