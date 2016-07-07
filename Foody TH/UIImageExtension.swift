//
//  UIImageExtension.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/7/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

extension UIImage {
    static func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
