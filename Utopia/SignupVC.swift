//
//  SignupVC.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 18/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class SignupVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, dismissViewProtocol, showAlertProtocol {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let checker: Checker = Checker()
    var birthdayView: SignupBirthday!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var aboutTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdayView = Bundle.main.loadNibNamed(Constant.signupBirthday, owner: self, options: nil)?.first as! SignupBirthday
        self.birthdayView.delegate1 = self
        self.birthdayView.delegate2 = self
        
    }
    
    func dismissView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        
        if let birthday = UserDefaults.standard.value(forKey: Constant.birthdayKey) as? String {
            
            self.birthdayLabel.text = birthday
        }
        
    }
    
    func showAlert() {
        
        self.alertUser(title: Constant.error, message: Constant.errBirthMessage, response: Constant.alright, actionStyle: UIAlertActionStyle.default)
    }
    
    func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
    
    @IBAction func nameInput(_ sender: UITextField) {
        textFieldDidBeginEditing(nameTextField)
    }
    
    @IBAction func nickNameInput(_ sender: UITextField) {
        textFieldDidBeginEditing(nickNameTextField)
    }
    
    @IBAction func occupationInput(_ sender: UITextField) {
        textFieldDidBeginEditing(occupationTextField)
    }
    
    @IBAction func aboutInput(_ sender: UITextField) {
        textFieldDidBeginEditing(aboutTextField)
    }
    
    @IBAction func getBirthday(_ sender: UIButtonX) {
        birthdayView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(birthdayView)
    }
    
    @IBAction func userTappedNext(_ sender: UIButtonX) {
        if nameTextField.text != "" && nickNameTextField.text != "" && occupationTextField.text != "" && aboutTextField.text != "" {
            
            UserDefaults.standard.set(nameTextField.text, forKey: Constant.fullNameKey)
            UserDefaults.standard.set(nickNameTextField.text, forKey: Constant.nickNameKey)
            UserDefaults.standard.set(occupationTextField.text, forKey: Constant.occupationKey)
            UserDefaults.standard.set(aboutTextField.text, forKey: Constant.aboutKey)
            self.pushToPage(Constant.signupCredentials, storyboard: Constant.loginStoryboard)
        } else {
            self.alertUser(title: Constant.missingFields, message: Constant.provideFields, response: Constant.response, actionStyle: .default)
        }
        
    }
    
}
