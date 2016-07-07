//
//  RegisterVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/7/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func unwindSegue() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.origin.y)!, screenSize.width, 45)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.colorFromHexString("#747676")), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        //self.view.backgroundColor = UIColor.colorFromHexString("#1f443c")
        self.title = "สมัครสมาชิก"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let backBT = UIBarButtonItem(image: UIImage(named: "bt_back"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(RegisterVC.unwindSegue))
        navigationItem.leftBarButtonItem = backBT
    }
}
