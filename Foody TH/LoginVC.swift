//
//  LoginVC.swift
//  Foody TH
//
//  Created by Taeshawit Suwanwigo on 7/2/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyboard))
        self.view.addGestureRecognizer(tab)

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
    
}
