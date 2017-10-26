//
//  AuthProvider.swift
//  KolodaViewTest
//
//  Created by Kemuel Clyde Belderol on 10/09/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

typealias LoginHandler = (_ msg: String?) -> Void;

struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid email address, please provide a valid email address";
    static let WRONG_PASSWORD = "Wrong password, please enter the correct password";
    static let PROBLEM_CONNECTING = "Problem connecting to server";
    static let USER_NOT_FOUND = "User not Found, please register";
    static let EMAIL_ALREADY_IN_USE = "Email is already in use, please use another email";
    static let WEAK_PASSWORD = "Password should be at least 6 characters long";
    static let WRONG_CREDENTIALS = "Either the password or email is wrong";
    
}

class AuthProvider {
    private static let _instance = AuthProvider();
    var delegate: showAlertProtocol?
    
    static var Instance: AuthProvider {
        return _instance;
    }
    
    func login(withEmail: String, andPassword: String, loginHandler: LoginHandler?) {
        
        Auth.auth().signIn(withEmail: withEmail, password: andPassword, completion: { (user, error) in
            if error != nil {
                self.handleErrors(error: error as! NSError, loginHandler: loginHandler);
            } else {
                loginHandler?(nil);
            }
        });
    }//login func
    
    func signUp(withEmail: String, andPassword: String, fullName: String, withOccupation: String?, andAboutMe: String?, birthday: String?, loginHandler: LoginHandler?) {
        Auth.auth().createUser(withEmail: withEmail, password: andPassword, completion: { (user, error) in
            if error != nil {
                print("\(error?.localizedDescription)")
                self.handleErrors(error: error as! NSError, loginHandler: loginHandler);
            } else {
                if let uid = user?.uid {
                    let values =
                        ["uid":uid, "email":withEmail, "fullName":fullName, "occupation":withOccupation, "aboutMe":andAboutMe, "birthday": birthday]
                        self.registerUserIntoDatabaseWithUID(uid, values: values)
                        self.login(withEmail: withEmail, andPassword: andPassword, loginHandler: loginHandler)
                    
                }
            }
        })
    }// signup func
    
    private func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: Any]) {
                let ref = Database.database().reference()
                let usersReference = ref.child("users").child(uid)
        
                usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
        
                    if err != nil {
                        self.delegate?.showAlert()
                        return
                    }
        
                })
            }

    
    private func handleErrors(error: NSError, loginHandler: LoginHandler?) {
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch errorCode {
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD)
                break;
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL)
                break;
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND)
                break;
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE)
                break;
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD)
                break;
            case .accountExistsWithDifferentCredential:
                loginHandler?(LoginErrorCode.WRONG_CREDENTIALS)
                break
            default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING)
                break;
            }
        }
    }
    
}
