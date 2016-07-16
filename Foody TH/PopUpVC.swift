//
//  PopUpVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/14/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit
import Alamofire

protocol PopUpViewControllerDelegate {
    func popUpViewControllerDidDismiss()
    func popUpDetailDidTouchUp(foodName: String)
}

class PopUpVC: BaseViewController {
    
    var delegate: PopUpViewControllerDelegate?

    @IBOutlet var popUpView: UIView!
    
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodName: UILabel!
    
    var foodName_lbl : String = "แกงฮังเล"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodName.text = foodName_lbl
        
        popUpView.layer.cornerRadius = 10
        popUpView.layer.borderColor = UIColor.blackColor().CGColor
        popUpView.layer.borderWidth = 0.25
        popUpView.layer.shadowColor = UIColor.blackColor().CGColor
        popUpView.layer.shadowOpacity = 0.6
        popUpView.layer.shadowRadius = 15
        popUpView.layer.shadowOffset = CGSize(width: 5, height: 5)
        popUpView.layer.masksToBounds = false
        
        //foodName
        self.randomFoodMenu()
        self.foodName.text = ""
    }
    
    func randomFoodMenu() {
        Alamofire.request(.GET, "http://foodyth.azurewebsites.net/foody/random3.php") .responseJSON { response in
            print(response.request!)
            print(response.response!)
            print(response.result)
            
            if let JSON = response.result.value {
                let (JSONTuple) = JSON
                //print(JSONTuple)
                let food_name = JSONTuple["name_food"] as? String
                let img = JSONTuple["img"] as? String
                
                self.setRandomFood(img!, foodname: food_name!)

            }
            else {
                print("JSON data is nil.")
            }
        }
    }
    
    func setRandomFood(url : String, foodname : String) {
        self.foodName.text = foodname
        LoadImage.loadImageFromUrl(url, view: self.foodImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitAction(sender: AnyObject) {
        //dim(.Out, speed: 0.5)
        //self.unwindSegue()
        //self.view.hidden = true
        
        self.dismissViewControllerAnimated(true, completion: {
            if (self.delegate != nil) {
                self.delegate?.popUpViewControllerDidDismiss()
            }
        })
        
        
    }
    
    
    @IBAction func foodDetailAction(sender: AnyObject) {
        if (delegate != nil) {
            delegate?.popUpDetailDidTouchUp(self.foodName.text!)
        }
        self.dismissViewControllerAnimated(true, completion: {
            if (self.delegate != nil) {
                self.delegate?.popUpDetailDidTouchUp(self.foodName.text!)
            }
        })
    }

    func unwindSegue() {
        navigationController?.popViewControllerAnimated(true)
    }

}
