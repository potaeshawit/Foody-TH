//
//  FoodDetail.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/12/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit
import Alamofire

class FoodDetail: BaseViewController {

    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodName: UILabel!
    
    @IBOutlet var about_lbl: UITextView!
    @IBOutlet var ingredient_lbl: UITextView!
    @IBOutlet var howTo_lbl: UITextView!
 
    @IBOutlet var favBt: UIButton!
    
    var url : String = ""
    
    var foodName_lbl = ""
    
    var foodDetail : Dictionary<String, AnyObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get info from DB
        //let loginState = ViewManagerPlist.sharedInstance.getValueForKey("loginState") as! Bool
        let loginState = false
        
        print("2: \(loginState)")
        
        if(loginState == false) {
            favBt.enabled = false
        }
        
        foodName.text = foodName_lbl
        LoadImage.loadImageFromUrl(url, view: self.foodImage)
        
        about_lbl.text = foodDetail["description"] as! String
        ingredient_lbl.text = foodDetail["prepare_ingredient"] as! String
        howTo_lbl.text = foodDetail["cooking_method"] as! String
        
        self.checkFavStatus()

    }
    
    func checkFavStatus() {
        let id_user = 1
        let id_food = foodDetail["id_food"]
        
        print(id_food)
        
        Alamofire.request(.POST, "http://foodyth.azurewebsites.net/foody/favorite_status.php", parameters: ["id_user" : id_user, "id_food": id_food!]) .responseJSON { response in
            debugPrint(response)
            
            if let JSON = response.result.value {
                //print("Did receive JSON data: \(JSON)")
                let status = JSON["is_favorite"] as! Bool
                self.favoriteStatusCheck(status)
                
            }
            else {
                print("JSON data is nil.")
            }
        }
    
    }
    
    func commonInit(url : String, foodname : String, foodDetail : Dictionary<String, AnyObject>) {
        self.url = url
        self.foodName_lbl = foodname
        self.foodDetail = foodDetail
    }

    @IBAction func favoriteAction(sender: AnyObject) {
        
        let id_user = 1
        let id_food = foodDetail["id_food"]
        
        Alamofire.request(.POST, "http://foodyth.azurewebsites.net/foody/favorite_food.php", parameters: ["id_user" : id_user, "id_food": id_food!]) .responseJSON { response in
            debugPrint(response)
            
            if let JSON = response.result.value {
                //print("Did receive JSON data: \(JSON)")
                let status = JSON["is_favorite"] as! Bool
                self.favoriteStatusCheck(status)
            }
            else {
                print("JSON data is nil.")
            }
        }
        
    }
    
    func favoriteStatusCheck(favStat : Bool) {
        if(favStat == true) {
            favBt.setImage(UIImage(named: "faved.png"), forState: .Normal)
        } else {
            favBt.setImage(UIImage(named: "fav.png"), forState: .Normal)
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
