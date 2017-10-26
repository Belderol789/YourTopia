//
//  ViewControllerExtension.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 16/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func presentToPage(_ title: String, storyboard: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        let enteringController = storyboard.instantiateViewController(withIdentifier: title)
        self.present(enteringController, animated: true, completion: nil)
    }
    
    func pushToPage(_ title: String, storyboard: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        let enteringController = storyboard.instantiateViewController(withIdentifier: title)
        self.navigationController?.pushViewController(enteringController, animated: true)
    }
    
    func alertUser(title: String, message: String, response: String, actionStyle: UIAlertActionStyle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertResponse = UIAlertAction(title: response, style: actionStyle, handler: nil)
        alert.addAction(alertResponse)
        self.present(alert, animated: true, completion: nil)
    }

}
