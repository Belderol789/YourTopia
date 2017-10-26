//
//  ImageViewEx.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 16/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func circularImageView() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
    
    func loadImageUsingCacheWithUrlString(urlString: String) {
        
        self.image = nil
        let imageCache = NSCache<AnyObject, AnyObject>()
        
        // Check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage as? UIImage
            return
        }
        
        // Otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            // Dowload hit an error so let's return out
            if error != nil {
                print(error!)
                
                return
            }
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                    
                }
            })
        }).resume()
    }

}
