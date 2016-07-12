//
//  FourthViewController.swift
//  Foody
//
//  Created by Layle <3 ~~~ on 6/30/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import Foundation
import UIKit

class FoodSearchVC : BaseViewController {
    
    @IBOutlet var ingredientSearchBt: UIButton!
    @IBOutlet var categorySearchBt: UIButton!
    @IBOutlet var uiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func ingredientSearchAction(sender: AnyObject) {
    }
    
    @IBAction func categorySearchAction(sender: AnyObject) {
    }
}