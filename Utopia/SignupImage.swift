//
//  SignupVC3.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 18/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import CoreData

class SignupImage: UIViewController {
    
    var user: String = ""
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var managedObjectContext:NSManagedObjectContext!

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var imageView: UIImageViewX!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser?.uid != nil {
           user = (Auth.auth().currentUser?.uid)!
            
        }
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        

    }
    
    func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

    @IBAction func userChoseImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                present(picker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButtonX) {
        if imageView.image != nil {
            setupActivityIndicator()
            if let email = UserDefaults.standard.value(forKey: "email") as? String {
                let storageRef = Storage.storage().reference().child("profile_images").child("\(email).jpg")
                if let profileImage = self.imageView.image, let uploadData = UIImageJPEGRepresentation(profileImage, 0.1) {
                    storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                        if error != nil {
                            print(error!)
                            self.alertUser(title: "Error", message: "We're sorry, there was an issue in uploading image", response: "Ok", actionStyle: .destructive)
                            return
                        }
                        
                        if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                            UserDefaults.standard.set(profileImageUrl, forKey: Constant.profilePicKey)
                            let addImage = ["profilePic": profileImageUrl]
                            self.registerUserIntoDatabaseWithUID(self.user, values: addImage as [String : AnyObject])
                            
                        }
                        
                    })
                }
                
            }
        } else {
             self.alertUser(title: Constant.error, message: "Please choose an Image", response: Constant.response, actionStyle: .destructive)
        }
       
        
    }
    
    
    
    private func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
                let ref = Database.database().reference()
                let usersReference = ref.child("users").child(uid)
        
                usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
        
                    if err != nil {
                        self.alertUser(title: "Error", message: "Problem with saving image", response: "Ok", actionStyle: .destructive)
                        return
                    } else {
                        self.activityIndicator.stopAnimating()
                        let storyboard = UIStoryboard(name: Constant.mainStoryboard, bundle: Bundle.main)
                        guard let feedController = storyboard.instantiateViewController(withIdentifier: Constant.tabController) as? UITableViewController else {return}
                        self.present(feedController, animated: true, completion: nil)
                    }
        
                })
            }
    
}

extension SignupImage : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("User canceled out of picker")
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        var selectedImageFromPicker: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage
        {
            selectedImageFromPicker = editedImage

        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            selectedImageFromPicker = originalImage
        }

        if let selectedImage = selectedImageFromPicker
        {
            imageView.image = selectedImage
            cameraButton.alpha = 0
            self.createImageItem(with: selectedImage)
            
        }

        dismiss(animated: true, completion: nil)
    }
    
    
    private func createImageItem(with image: UIImage) {
        let userPhoto = User(context: managedObjectContext)
        userPhoto.profilePic = NSData(data: UIImageJPEGRepresentation(image, 0.3)!)
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Could not save user Image")
        }
        
    }

}
