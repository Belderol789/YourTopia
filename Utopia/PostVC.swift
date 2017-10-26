//
//  PostVC.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 17/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit
import AVFoundation


class PostVC: UIViewController {
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var orLabel: UILabelX!
    @IBOutlet weak var galleryView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var overallView: UIView!
    
    
    let camera: Camera = Camera()
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    var captureDevice: AVCaptureDevice!
    
    var takePhoto: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.orLabel.alpha = 1
        self.galleryView.transform = .identity
        self.photoView.transform = .identity
        self.overallView.isHidden = false
        camera.prepareCamera(UIView: self.view)
    }
    
    
    
    
    @IBAction func userDidTapCamera(_ sender: UIButton) {
        takePhoto = true;
    }
    
    @IBAction func userDidTapGallery(_ sender: UIButton) {
        
    }
    
    @IBAction func userChoseCamera(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.orLabel.alpha = 0;
        }) { (true) in
            UIView.animate(withDuration: 1, animations: { 
                self.galleryView.transform = CGAffineTransform(translationX: 0, y: self.galleryView.frame.height + 100)
                self.photoView.transform = CGAffineTransform(translationX: 0, y: 0 - (self.photoView.frame.height + 100))
            }, completion: { (true) in
                 self.overallView.isHidden = true
            })
            
        }
        
        
    }
    
    
    
    @IBAction func userCanceled(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}












