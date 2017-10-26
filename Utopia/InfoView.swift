//
//  InfoView.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 13/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class InfoView: UIView {

    
    @IBOutlet weak var nickNameLabel: UITextField!
    @IBOutlet weak var jobLabel: UITextField!
    @IBOutlet weak var aboutLabel: UITextView!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        if let userNickName = Constant.nickName as? String {
            nickNameLabel.text = userNickName
        }
        
        if let userJob = Constant.occupation as? String {
            jobLabel.text = userJob
        }
        
        if let userAbout = Constant.about as? String {
            aboutLabel.text = userAbout
        }
        
        if let userBirthday = Constant.birthday as? String {
            birthdayLabel.text = userBirthday
        }
        
    }
    
    
    
    
   
}
