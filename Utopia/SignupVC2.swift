//
//  SignupVC2.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 18/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class SignupVC2: UIViewController {

    @IBOutlet weak var aboutTextView: UITextViewX!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func buttonTapped(_ sender: UIButtonX) {
        if aboutTextView.text != "" {
            UserDefaults.standard.setValue(aboutTextView.text, forKey: "aboutMe")
            self.pushToPage("SignupVC", storyboard: "Login")
        } else {
            self.alertUser(title: "Blank Space", message: "Even just a little.", response: "Ok", actionStyle: UIAlertActionStyle.default)
        }
    }
    

}
