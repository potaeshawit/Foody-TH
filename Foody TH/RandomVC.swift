//
//  RandomVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/11/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit
import Alamofire

class RandomVC: BaseViewController, Dimmable, PopUpViewControllerDelegate {

    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5

    
    var foodDetails : Dictionary<String, AnyObject>!
    var url : String = ""
    var randomFoodName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func randomBt(sender: AnyObject) {
        //random foodname
        self.randomFromDB()
        
        dim(.In, alpha: dimLevel, speed: dimSpeed)
        
        let vc = PopUpVC()
        vc.delegate = self
        vc.modalPresentationStyle = .OverCurrentContext
        vc.preferredContentSize = CGSizeMake(300, 520)
        
//        let popoverVC = vc.popoverPresentationController
//        popoverVC?.permittedArrowDirections = .Up
//        popoverVC?.delegate = self
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        presentVC(vc)

//        let vc = PopUpVC()
        vc.modalPresentationStyle = .OverFullScreen
        vc.modalTransitionStyle = .CoverVertical
        vc.foodName_lbl = "ข้าวกะเพราหมูสับ"
        
        self.modalInPopover = true
        self.presentVC(vc)
        
    }
    
    func popUpViewControllerDidDismiss() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        dim(.Out, speed: 0.5)

    }
    
    func popUpDetailDidTouchUp(foodName: String) {
        let vc = FoodDetail()
        //vc.foodName_lbl = foodName
        vc.commonInit(url, foodname: foodName, foodDetail: foodDetails!)
        self.pushVC(vc)
    }
    
    func randomFromDB() {
        Alamofire.request(.GET, "http://foodyth.azurewebsites.net/foody/random3.php") .responseJSON { response in
            //print(response.request!)
            //print(response.response!)
            //print(response.result)
            
            if let JSON = response.result.value {
                let (JSONTuple) = JSON
                let food_name = JSONTuple["name_food"] as? String
                let img = JSONTuple["img"] as? String
                
                let details = JSONTuple as? Dictionary<String, AnyObject>
                
                
                self.setRandomFood(img!, foodname: food_name!, JSONTuple: details!)
                
            }
            else {
                print("JSON data is nil.")
            }
        }
    
    }
    
    func setRandomFood(url : String, foodname : String, JSONTuple : Dictionary<String, AnyObject>) {
        self.randomFoodName = foodname
        self.foodDetails = JSONTuple
        self.url = url
    }
}
