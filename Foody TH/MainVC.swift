//
//  MainVC.swift
//  Foody TH
//
//  Created by Taeshawit Suwanwigo on 7/2/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class MainVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(sender: AnyObject) {
        let vc = LoginVC()
        self.pushVC(vc)
    }
    
    @IBAction func registerAction(sender: AnyObject) {
        let vc = RegisterVC()
        self.pushVC(vc)
    }
    
    @IBAction func skipAction(sender: AnyObject) {
        let tabBarController = TabBarController()
        ViewManagerPlist.sharedInstance.saveValue(false, forKey: "loginState")
        self.pushVC(tabBarController)
        
    }
}
