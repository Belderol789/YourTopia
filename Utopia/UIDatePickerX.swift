//
//  UIDatePickerX.swift
//  Utopia
//
//  Created by Kemuel Clyde Belderol on 16/10/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

import UIKit
@IBDesignable

class UIDatePickerX: UIDatePicker {
    
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

   

}
