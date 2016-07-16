//
//  IngredientsSearchVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/11/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class IngredientsSearchVC: BaseViewController, Dimmable, IngredientViewControllerDelegate {

    @IBOutlet var ingredientTableView: UITableView!
    
    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5
    
    var selectedIngredients : [Bool] = []
    var ingredients : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectIngredientAction(sender: AnyObject) {
        dim(.In, alpha: dimLevel, speed: dimSpeed)
        
        let vc = IngredientsVC()
        vc.delegate = self
        vc.modalPresentationStyle = .OverCurrentContext
        vc.preferredContentSize = CGSizeMake(300, 520)
        
        vc.modalPresentationStyle = .OverFullScreen
        vc.modalTransitionStyle = .CoverVertical
        
        self.modalInPopover = true
        vc.commonInit(self.selectedIngredients, ingd: self.ingredients)
        self.presentVC(vc)
    }
    
    func ingredientViewControllerDidDismiss(selectedIngd : [Bool], ingredients : [String]) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        dim(.Out, speed: 0.5)
        
        print("\n\nIn Main")
        print(selectedIngd)
        print(ingredients)
    }
    
    
    @IBAction func deleteAllIngredientAction(sender: AnyObject) {
    }
    
    @IBAction func searchAction(sender: AnyObject) {
        
    }
    
}
