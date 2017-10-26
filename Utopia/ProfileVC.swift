//
//  ProfileVC.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 12/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var aboutMe: UIButton!
    @IBOutlet weak var interestButton: UIButton!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet var Buttons: [UIButtonX]!
    @IBOutlet weak var profilePicImageView: UIImageViewX!{
        didSet{
            profilePicImageView.image = UIImage(named: "user")
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBOutlet weak var slidingView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let slides:[UIView] = createSlides()
        setupScrollView(slides: slides)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.checkUserDefaults()
    }
    
    func checkUserDefaults() {
        if let profilePic = Constant.profilePic as? String {
            profilePicImageView.loadImageUsingCacheWithUrlString(urlString: profilePic)
        }
        
        if let name = Constant.fullName as? String {
            nameLabel.text = name
            
        }
        
    }
    
    @IBAction func aboutTapped(_ sender: UIButton) {
       self.setButtonColors(sender: sender)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
    }
    
    @IBAction func interestTapped(_ sender: UIButton) {
      self.setButtonColors(sender: sender)
        scrollView.setContentOffset(CGPoint(x: slidingView.frame.width , y: 0), animated: true)
        
        
    }
    
    @IBAction func myScoreTapped(_ sender: UIButton) {
      self.setButtonColors(sender: sender)
        scrollView.setContentOffset(CGPoint(x: slidingView.frame.width * 2, y: 0), animated: true)
    }
    
    func setButtonColors(sender: UIButton) {
        for each in Buttons {
            if each == sender {
                sender.setTitleColor(.white, for: .normal)
                sender.backgroundColor = Constant.orange
            } else {
                each.setTitleColor(.white, for: .normal)
                each.backgroundColor = Constant.blue
            }
        }
      
    }
    
    
    
    func createSlides() -> [UIView] {
        let slides1:InfoView = Bundle.main.loadNibNamed(Constant.infoView, owner: self, options: nil)?.first as! InfoView
        let slides2:ProfileFeed = Bundle.main.loadNibNamed(Constant.profileFeed, owner: self, options: nil)?.first as! ProfileFeed
        let slides3:ScoreView = Bundle.main.loadNibNamed(Constant.scoreView, owner: self, options: nil)?.first as! ScoreView
        
        return [slides1, slides2, slides3]
    }
    
    func setupScrollView(slides:[UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.slidingView.frame.width, height: self.slidingView.frame.height)
        scrollView.contentSize = CGSize(width: slidingView.frame.width * CGFloat(slides.count), height: self.slidingView.frame.height)
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: slidingView.frame.width * CGFloat(i), y: 0, width: slidingView.frame.width, height: self.slidingView.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
}


