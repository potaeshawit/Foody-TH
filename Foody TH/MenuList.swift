
//
//  MenuList.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/13/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit
import Alamofire

class MenuList: BaseViewController, UITableViewDelegate, UITableViewDataSource, FoodCellDelegate {

    @IBOutlet var tableView: UITableView!
    
    var foodType : String = ""
    
    var foodName: [String] = []
    var imageName: [String] = []
    
    var foodDetails: [Dictionary<String, AnyObject>] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getFoodMenu()
            }
    
    func temp() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nibName = UINib(nibName: "FoodCell", bundle: nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "foodCell")
        
        tableView.reloadData()
    }
    
    func getFoodMenu() {
        
        var typefood = 1
        switch(foodType) {
        case "ต้ม":
            typefood = 1
        case "ผัด":
            typefood = 2
        case "แกง":
            typefood = 3
        case "ทอด":
            typefood = 4
        case "นึ่ง":
            typefood = 5
        case "ปิ้ง-ย่าง":
            typefood = 6
        case "สลัด-ยำ":
            typefood = 7
        default:
            break
        }
        
        Alamofire.request(.POST, "http://foodyth.azurewebsites.net/foody/food.php", parameters: ["id_typefood" : typefood]) .responseJSON { response in
            debugPrint(response)
            
            //print(response.request!)
            //print(response.response!)
            //print(response.result)
            
            if let JSON = response.result.value {
                //print("Did receive JSON data: \(JSON)")
                let foods = JSON["foods"]
                let (JSONDic) = foods
                let dict = JSONDic as! [Dictionary<String, AnyObject>]
                for elem in dict {
                    self.addToFoodNameArray(elem["name_food"] as! String, imageName: elem["img"] as! String)
                    self.addFoodDetailsToArray(elem)
                
                }
                

            }
            else {
                print("JSON data is nil.")
            }
            self.temp()
        }
        
    }
    
    func addToFoodNameArray(foodname : String, imageName: String) {
        foodName.append(foodname)
        self.imageName.append(imageName)
        
    }
    
    func addFoodDetailsToArray(details: Dictionary<String, AnyObject>) {
        foodDetails.append(details)
    }
    
    func popBackToCategory() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //get amount from DB
        return foodName.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70 * 1.29
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foodCell", forIndexPath: indexPath) as! FoodCell
        cell.delegate = self
        cell.commonInit(imageName[indexPath.item], foodName: foodName[indexPath.item], foodDetail: foodDetails[indexPath.item])
        return cell
    }
    
    func foodCellDidTouchUpInside(cell: UITableViewCell, url: String, foodname: String, foodDetail : Dictionary<String, AnyObject>) {
        let foodCell = cell as! FoodCell
        foodCell.commonInit(url, foodName: foodname, foodDetail: foodDetail)
        //create Food Details According to foodName -> send url too!
        let vc = FoodDetail()
        self.pushVC(vc)
        vc.commonInit(url, foodname: foodname, foodDetail: foodDetail)


    }

}
