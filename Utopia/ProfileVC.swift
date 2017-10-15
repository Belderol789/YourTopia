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
   
  
    
    @IBOutlet weak var slidingView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
     override func viewDidLoad() {
        super.viewDidLoad()
        
        let slides:[UIView] = createSlides()
        setupScrollView(slides: slides)
      

    }
  
    @IBAction func aboutTapped(_ sender: UIButton) {
        interestButton.setTitleColor(Constant.blue, for: .normal)
        aboutMe.setTitleColor(.white, for: .normal)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
    }
    
    @IBAction func interestTapped(_ sender: UIButton) {
        interestButton.setTitleColor(.white, for: .normal)
        aboutMe.setTitleColor(Constant.orange, for: .normal)
        scrollView.setContentOffset(CGPoint(x: slidingView.frame.width , y: 0), animated: true)
        
        
    }
    
    
   
    
    func createSlides() -> [UIView] {
        let slides1:InfoView = Bundle.main.loadNibNamed("InfoView", owner: self, options: nil)?.first as! InfoView
        let slides2:ProfileFeed = Bundle.main.loadNibNamed("ProfileFeed", owner: self, options: nil)?.first as! ProfileFeed
      
        return [slides1, slides2]
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


