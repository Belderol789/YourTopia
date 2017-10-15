//
//  LoginVC.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 15/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func loginTapped(_ sender: UIButtonX) {
       self.gotToMain()
    }
    
    func gotToMain() {
        let storyboard = UIStoryboard(name: Constant.mainStoryboard, bundle: Bundle.main)
        guard let tabController = storyboard.instantiateViewController(withIdentifier: Constant.tabController) as? UITabBarController else {return}
        self.present(tabController, animated: true, completion: nil)
    }
}
