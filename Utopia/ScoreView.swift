//
//  ScoreView.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 17/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    var randomNumbers: [Float] = [100, 262, 936, 92, 10, 2, 363, 94, 99, 69]
    var randomTopic: [String] = ["Science", "Tech", "Random", "Science", "Tech", "Random", "Science", "Tech", "Random", "totalScoreLabel"]
    var totalScore: Float = 0
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(ScoreTableViewCell.cellNib, forCellReuseIdentifier: ScoreTableViewCell.cellIdentifier)
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        
        setupDelegates()
    }
    
    func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getTotalScore() -> Float {
        if let totalScoreText = totalScoreLabel.text {
            self.totalScore = Float(totalScoreText)!
            return self.totalScore
            
        } else {
            return 1000
        }
        
        
        
    }
    

}

extension ScoreView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topicScore = randomNumbers[indexPath.row];
        let topic = randomTopic[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScoreTableViewCell.cellIdentifier, for: indexPath) as? ScoreTableViewCell else {return UITableViewCell()}
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.slider.maximumValue = getTotalScore()
        cell.slider.value = topicScore
        cell.scoreLabel.text = String(topicScore)
        cell.topicLabel.text = topic
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}
