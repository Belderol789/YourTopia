//
//  LoginVC.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 15/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {
    
    let checker: Checker = Checker()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var imageView: UIImageViewX!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    @IBAction func loginTapped(_ sender: UIButtonX) {
        loginUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkUserDefault()
    }
    
    func checkUserDefault() {
        
        if let userName = Constant.fullName as? String {
            self.navItem.title = userName
        }
        
        if let userPhoto = Constant.profilePic as? String {
            self.imageView.loadImageUsingCacheWithUrlString(urlString: userPhoto)
        }
        
    }
    
    func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    
    func gotToMain() {
        let storyboard = UIStoryboard(name: Constant.mainStoryboard, bundle: Bundle.main)
        guard let tabController = storyboard.instantiateViewController(withIdentifier: Constant.tabController) as? UITabBarController else {return}
        self.present(tabController, animated: true, completion: nil)
        
    }
    
    func loginUser() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            if checker.isValidEmail(emailTextField.text!) {
               // self.setupActivityIndicator()
                AuthProvider.Instance.login(withEmail: emailTextField.text!, andPassword: passwordTextField.text!, loginHandler: { (message) in
                    if message != nil {
                        self.alertUser(title: Constant.authError, message: message!, response: Constant.response, actionStyle: .default)
                       // self.activityIndicator.stopAnimating()
                    } else {
                        //self.activityIndicator.stopAnimating()
                        self.gotToMain()
                    }
                })
            } else {
                self.alertUser(title: Constant.invalidEmail, message: Constant.validEmail, response: Constant.response, actionStyle: .destructive)
            }
        } else {
            self.alertUser(title: Constant.missingFields, message: Constant.provideFields, response: Constant.response, actionStyle: .default)
        }
    }
    
    
}
