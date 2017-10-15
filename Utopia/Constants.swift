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
    
    public static let blue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    public static let orange = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1)
    public static let clearBlack = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    public static let subject = "SubjectsVC"
    public static let tabController = "TabController"
    public static let mainStoryboard = "Main"
    public static let mainVC = "MainVC"
    public static let resultsVC = "ResultsVC"
    public static let defaultButtonSubject = "1. CHOOSE A SUBJECT"
    public static let defaultButtonPrice = "2. CHOOSE A MINIMUM PRICE"
    public static let defaultButtonPlace = "3. CHOOSE A LOCATION"
    public static let subjectNumber = 10
    public static let errorSignIn = "Error Signing Up"
    public static let errorLogingIn = "Error Loging In"
    public static let apology = "We seem to be having an issue. Please retry again later."
    public static let response = "Ok"
    public static let authError = "Problem with Authentication"
    public static let invalidEmail = "Invalid Email"
    public static let validEmail = "Please provide a valid email address"
    public static let missingFields = "Missing Fields"
    public static let provideFields = "Please fill in all of the fields"
    public static let minus = "-"
    public static let plus = "+"
    public static let userDefaultsKey = "loggedInUser"
    //----------------------------------------------------//
//    public static let currentUser = Auth.auth().currentUser?.uid
//    public static let ref: DatabaseReference = Database.database().reference()
//    
//    public static func detailsOfUser() -> [String:Any] {
//        var userValues: [String:Any] = [:]
//        if let id = Auth.auth().currentUser?.uid {
//            ref.child("tutors").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
//                guard let dictionary = snapshot.value as? [String:Any] else
//                 {return}
//                let tutor = Tutor(dictionary: dictionary)
//                let values = ["name":tutor.name, "uid":tutor.uid, "occupation":tutor.occupation, "school":tutor.school, "aboutMe":tutor.about, "photo":tutor.photo]
//                userValues = values
//  
//            })
//        }
//        
//        return userValues
//        
//    }
}
