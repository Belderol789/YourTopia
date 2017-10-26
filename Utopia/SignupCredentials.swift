//
//  SignupCredentials.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 20/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class SignupCredentials: UIViewController {
    
    let checker: Checker = Checker()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var fullName: String = ""
    var occupation: String = ""
    var about: String = ""
    var birthday: String = ""

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = UserDefaults.standard.value(forKey: "fullName") as? String
        loadUserDefaults()

    }
    
    func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func showAlert() {
        self.alertUser(title: Constant.errorSignIn, message: Constant.apology, response: Constant.response, actionStyle: .destructive)
    }
    
    func loadUserDefaults() {
        if UserDefaults.standard.value(forKey: "fullName") as? String != nil, UserDefaults.standard.value(forKey: "occupation") as? String != nil, UserDefaults.standard.value(forKey: "about") as? String != nil {
            fullName = UserDefaults.standard.value(forKey: "fullName") as! String
            occupation = UserDefaults.standard.value(forKey: "occupation") as! String
            about = UserDefaults.standard.value(forKey: "about") as! String
            birthday = UserDefaults.standard.value(forKey: "birthday") as! String
        }
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButtonX) {
        if emailTextField.text != "" && passwordTextField.text != "" && confirmTextField.text != "" {
            if checker.isValidEmail(emailTextField.text!) {
                if passwordTextField.text == confirmTextField.text {
                    self.setupActivityIndicator()
                    AuthProvider.Instance.signUp(withEmail: emailTextField.text!, andPassword: passwordTextField.text!, fullName: self.fullName, withOccupation: self.occupation, andAboutMe: self.about, birthday: self.birthday, loginHandler: { (message) in
                        if message != nil {
                            self.alertUser(title: Constant.errorSignIn, message: message!, response: Constant.response, actionStyle: .default)
                            self.activityIndicator.stopAnimating()
                        } else {
                            UserDefaults.standard.setValue(self.emailTextField.text, forKey: "email")
                            self.activityIndicator.stopAnimating()
                            UIApplication.shared.endIgnoringInteractionEvents()
                            self.presentToPage("SignupImage", storyboard: "Login")
                        }
                    })
                } else {
                    self.alertUser(title: Constant.invalidPassword, message: Constant.validPasswords, response: Constant.response, actionStyle: .destructive)
                }
               
            } else {
                self.alertUser(title: Constant.invalidEmail, message: Constant.validEmail, response: Constant.response, actionStyle: .destructive)
            }
        } else {
            self.alertUser(title: Constant.missingFields, message: Constant.provideFields, response: Constant.response, actionStyle: .default)
        }

    }
    

}
