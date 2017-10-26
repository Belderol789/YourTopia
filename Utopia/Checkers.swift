//
//  Checkers.swift
//  KolodaViewTest
//
//  Created by Kemuel Clyde Belderol on 10/09/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit


class Checker: UIViewController {
    
    func isValidEmail(_ email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    
}
