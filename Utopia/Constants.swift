//
//  Constants.swift
//  Tutoree
//
//  Created by Kemuel Clyde Belderol on 30/09/2017.
//  Copyright © 2017 Krats. All rights reserved.
//

import UIKit
//import FirebaseAuth
//import FirebaseDatabase


class Constant {
    
    
    //colors
    static let blue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    static let orange = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1)
    static let clearBlack = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    
    //view identifiers
    static let subject = "SubjectsVC"
    static let tabController = "TabController"
    static let mainStoryboard = "Main"
    static let loginStoryboard = "Login"
    static let mainVC = "MainVC"
    static let resultsVC = "ResultsVC"
    static let postVC = "PostVC"
    static let signupCredentials = "SignupCredentials"
    static let signupBirthday = "SignupBirthday"
    static let infoView = "InfoView"
    static let profileFeed = "ProfileFeed"
    static let scoreView = "ScoreView"
    
    
    //Pop ups
    static let errorSignIn = "Error Signing Up"
    static let error = "Error"
    static let errBirthMessage = "Sorry we mised that. Could you turn it again"
    static let errorLogingIn = "Error Loging In"
    static let apology = "We seem to be having an issue. Please retry again later."
    static let response = "Ok"
    static let alright = "Alright"
    static let authError = "Problem with Authentication"
    static let invalidEmail = "Invalid Email"
    static let invalidPassword = "Invalid Passwords"
    static let validEmail = "Please provide a valid email address"
    static let missingFields = "Missing Fields"
    static let provideFields = "Please fill in all of the fields"
    static let validPasswords = "Passwords do not match. Remember passwords are case sensitive"
    static let minus = "-"
    static let plus = "+"
    
    //UserDefaultsKeys
    static let fullNameKey = "fullName"
    static let occupationKey = "occupation"
    static let aboutKey = "about"
    static let birthdayKey = "birthday"
    static let nickNameKey = "nickName"
    static let profilePicKey = "profilePic"
    
    //UserDefaults
    static let fullName = UserDefaults.standard.value(forKey: Constant.fullNameKey)
    static let occupation = UserDefaults.standard.value(forKey: Constant.occupationKey)
    static let about = UserDefaults.standard.value(forKey: Constant.aboutKey)
    static let birthday = UserDefaults.standard.value(forKey: Constant.birthdayKey)
    static let profilePic = UserDefaults.standard.value(forKey: Constant.profilePicKey)
    static let nickName = UserDefaults.standard.value(forKey: Constant.nickNameKey)
    
    
    
    
    
}
