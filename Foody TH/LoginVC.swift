//
//  LoginVC.swift
//  Foody TH
//
//  Created by Taeshawit Suwanwigo on 7/2/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController, UITextFieldDelegate {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyboard))
        self.view.addGestureRecognizer(tab)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func unwindSegue() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.origin.y)!, screenSize.width, 45)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.clearColor()), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        //self.view.backgroundColor = UIColor.colorFromHexString("#1f443c")
        self.title = "สมัครสมาชิก"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let backBT = UIBarButtonItem(image: UIImage(named: "bt_back"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(RegisterVC.unwindSegue))
        navigationItem.leftBarButtonItem = backBT
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        let tabBarController = TabBarController()
        ViewManagerPlist.sharedInstance.saveValue(true, forKey: "loginState")
        self.pushVC(tabBarController)
    }
}
