//
//  UIViewX.swift
//  Tutoree
//
//  Created by Kemuel Clyde Belderol on 27/09/2017.
//  Copyright © 2017 Krats. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class UIViewX: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var maskToBounds: Bool = true {
        didSet{
            self.layer.masksToBounds = maskToBounds
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = .clear {
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
  
}
