//
//  LoginView1.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 18/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class SignupBirthday: UIView {

    var birthdayExist: Bool?
    var delegate1: dismissViewProtocol?
    var delegate2: showAlertProtocol?
    
    @IBOutlet weak var birthdayView: UIViewX!
    @IBOutlet weak var datePicker: UIDatePicker!{
        didSet{
            datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
            
        }
    }
    
    func dateChanged(_ sender: UIDatePicker) {
     
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM-dd-yyyy"
            let userBirthday = dateFormatter.string(from: datePicker.date);
            UserDefaults.standard.set(userBirthday, forKey: Constant.birthdayKey)
            birthdayExist = true
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButtonX) {
        
        if birthdayExist != nil {
            delegate1?.dismissView()
            
        } else {
            delegate2?.showAlert()
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != birthdayView {
            delegate1?.dismissView()
        }
    }

}
