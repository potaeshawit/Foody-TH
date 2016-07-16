//
//  ProfileVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/12/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

enum SelectedBt {
    case Post
    case Favourite
}

class ProfileVC: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileName: UILabel!
    
    @IBOutlet var postBt: UIButton!
    @IBOutlet var favouriteBt: UIButton!
    
    @IBOutlet var uiView: UIView!
    
    var selectedBt = SelectedBt.Post
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postAction(sender: AnyObject) {
        if(selectedBt == .Favourite) {
            postBt.backgroundColor = UIColor.whiteColor()
            postBt.setTitleColor(UIColor.colorFromHexString("#F7751E"), forState: .Normal)
            
            favouriteBt.backgroundColor = UIColor.colorFromHexString("#F7751E")
            favouriteBt.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            selectedBt = .Post
        }
        
    }

    @IBAction func favouriteAction(sender: AnyObject) {
        if(selectedBt == .Post) {
            favouriteBt.backgroundColor = UIColor.whiteColor()
            favouriteBt.setTitleColor(UIColor.colorFromHexString("#F7751E"), forState: .Normal)
            
            postBt.backgroundColor = UIColor.colorFromHexString("#F7751E")
            postBt.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            selectedBt = .Favourite
        }
    }
    
    

}
