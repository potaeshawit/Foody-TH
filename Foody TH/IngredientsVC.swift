//
//  IngredientsVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/16/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit
import Alamofire

protocol IngredientViewControllerDelegate {
    func ingredientViewControllerDidDismiss(selectedIgd : [Bool], ingredients : [String])
}

class IngredientsVC: BaseViewController, UITableViewDelegate, UITableViewDataSource, IngredientCellDelegate {
    var delegate: IngredientViewControllerDelegate?
    
    var selectedIngredient : [Bool] = []
    var ingredients : [String] = []
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.layer.cornerRadius = 10
        self.view.layer.borderColor = UIColor.blackColor().CGColor
        self.view.layer.borderWidth = 0.25
        self.view.layer.shadowColor = UIColor.blackColor().CGColor
        self.view.layer.shadowOpacity = 0.6
        self.view.layer.shadowRadius = 15
        self.view.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.view.layer.masksToBounds = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //foodName
        if(selectedIngredient == [] || ingredients == []) {
            self.getIngredients()
        }

    }
    
    func commonInit(selected : [Bool], ingd : [String]) {
        self.selectedIngredient = selected
        self.ingredients = ingd
    
    }
    
    func getIngredients() {
        self.selectedIngredient = []
        self.ingredients = []
        Alamofire.request(.GET, "http://foodyth.azurewebsites.net/foody/getIngredients.php") .responseJSON { response in
            //            print(response.request!)
            //            print(response.response!)
            //            print(response.result)
            
            if let JSON = response.result.value {
                let (JSONTuple) = JSON
                print(JSONTuple)
                let ingredient_name = JSONTuple["name_material"] as? String
                
                self.setIngredient(ingredient_name!)
            }
            else {
                print("JSON data is nil.")
            }
            self.temp()
        }

    
    }
    
    func setIngredient(ingredient : String) {
        self.ingredients.append(ingredient)
        self.selectedIngredient.append(false)
    }
    
    func temp() {
        let nibName = UINib(nibName: "ingredientCell", bundle: nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "ingredientCell")
        
        tableView.reloadData()
    }
    
    @IBAction func confirmIngredientAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
            if (self.delegate != nil) {
                self.delegate?.ingredientViewControllerDidDismiss(self.selectedIngredient, ingredients: self.ingredients)
            }
        })

    }
    
    func foodCellDidSelected(cell: UITableViewCell, ingdName: String, index: Int, selected: Bool) {
        print("name: \(ingdName) : selected: \(selected)")
        self.selectedIngredient[index] = selected
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //get amount from DB
        return ingredients.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50 * 1.29
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell", forIndexPath: indexPath) as! IngredientsCell
        cell.delegate = self
        cell.commonInit(ingredients[indexPath.item], index: indexPath.item,selected: selectedIngredient[indexPath.item])
        return cell
    }
    
}
