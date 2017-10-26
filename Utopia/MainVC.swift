//
//  ViewController.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 11/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    var feedTableView: FeedTableView = FeedTableView()
    var lastContentOffSet: CGFloat = 0.0
    //
    var fakeTopics: [String] = ["Science", "Videogames", "Food", "Funny", "News"]
    var x = 0
    //
    
    @IBOutlet weak var exCategoryView: UIViewX!
    @IBOutlet weak var circleView: UIViewX!
    @IBOutlet weak var expandingView: UIViewX!
    @IBOutlet weak var newImagePost: UIButtonX!
    @IBOutlet weak var newTextPost: UIButtonX!
    @IBOutlet weak var newPostButton: UIButtonX!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var dropDown: UIButtonX!
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(FeedTableViewCell.cellNib, forCellReuseIdentifier: FeedTableViewCell.cellIdentifier)
            tableView.register(FeedImageTableViewCell.cellNib, forCellReuseIdentifier: FeedImageTableViewCell.cellIdentifier)
            tableView.reloadData()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(InterestCollectionViewCell.cellNib, forCellWithReuseIdentifier: InterestCollectionViewCell.cellIdentifier)
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.resetAnimations()
    }
    
    func resetAlphaValues() {
        self.newTextPost.alpha = 0
        self.newImagePost.alpha = 0
        self.collectionView.alpha = 0
    }
    
    override func viewWillLayoutSubviews() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    @IBAction func newPostTapped(_ sender: UIButtonX) {
        if expandingView.transform == CGAffineTransform.identity {
            UIView.animate(withDuration: 0.5, animations: {
                self.expandingView.transform = CGAffineTransform(scaleX: 10, y: 10)
            }, completion: { (true) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.newTextPost.alpha = 1
                    self.newImagePost.alpha = 1
                })
                
            })
        } else {
            self.resetAnimations()
        }
    }
    
    @IBAction func didTapDropDown(_ sender: UIButton) {
        if exCategoryView.transform == .identity {
            UIView.animate(withDuration: 0.5, animations: {
                self.exCategoryView.transform = CGAffineTransform(scaleX: 20, y: 20)
                self.categoryView.transform = CGAffineTransform(translationX: 0, y: self.collectionView.frame.height)
                self.dropDown.transform = CGAffineTransform(rotationAngle: self.convertToRadians(180))
                
            }, completion: { (true) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.dropDown.backgroundColor = Constant.orange
                    self.collectionView.alpha = 1
                })
                
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.categoryView.transform = .identity
                self.exCategoryView.transform = .identity
                self.collectionView.alpha = 0
                self.dropDown.transform = .identity
                self.dropDown.backgroundColor = UIColor.white.withAlphaComponent(0.1)
            })
            
        }
    }
    
    func convertToRadians(_ degrees: Double) -> CGFloat {
        return CGFloat(degrees * .pi / 180)
    }
    
    @IBAction func newUserPost(_ sender: UIButtonX) {
        
        let storyboard = UIStoryboard(name: Constant.mainStoryboard, bundle: Bundle.main)
        guard let postVC = storyboard.instantiateViewController(withIdentifier: Constant.postVC) as? PostVC else {return}
        self.present(postVC, animated: true, completion: nil)
        
        
    }
    
    
    func resetAnimations() {
        UIView.animate(withDuration: 0.5, animations: {
            self.resetAlphaValues()
        }, completion: { (true) in
            UIView.animate(withDuration: 0.5, animations: {
                self.expandingView.transform = .identity
            })
            
        })
        
    }
    
}



extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fakeTopics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let topic = fakeTopics[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCollectionViewCell.cellIdentifier, for: indexPath) as? InterestCollectionViewCell else {return UICollectionViewCell()}
        cell.backgroundColor = .clear
        cell.nextTopicButton.addTarget(self, action: #selector(scrollNext), for: .touchUpInside)
        cell.backTopicButton.addTarget(self, action: #selector(scrollBack), for: .touchUpInside)
        cell.topicLabel.text = topic
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    @objc func scrollNext() {
        if self.x < self.fakeTopics.count - 1 {
            self.x = self.x + 1
            let indexPath = IndexPath(item: x, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            print(x)
        } else {
            self.x = 0
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            print(x)
        }
    }
    
    @objc func scrollBack() {
        
        if self.x > 0 {
            
            self.x = self.x - 1
            let indexPath = IndexPath(item: x, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            print(x)
            
        }
    }
    
    
}

extension MainVC: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 335
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedImageTableViewCell.cellIdentifier, for: indexPath) as? FeedImageTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffSet = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffSet < scrollView.contentOffset.y) {
            
            //move to top
            UIView.animate(withDuration: 0.2, animations: {
                self.expandingView.alpha = 0
                self.newPostButton.alpha = 0
                self.resetAlphaValues()
            })
            
        } else {
            // moved to bottom
            self.expandingView.transform = .identity
            UIView.animate(withDuration: 0.2, animations: {
                self.expandingView.alpha = 1
                self.newPostButton.alpha = 1
            })
            
        }
    }
    
}

