//
//  FoodSearchVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/12/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class FoodSearchVC: UIViewController, UIPageViewControllerDelegate {
    
    @IBOutlet var scrollView: UIScrollView!

    var selectedBt = "ingredientSearch"
    var pageVC: UIPageViewController!
    
    @IBOutlet var ingredientsSearchBt: UIButton!
    @IBOutlet var categorySearchBt: UIButton!
    
    @IBOutlet var uiView: UIView!
    
    enum CurrentViewType {
        case IngredientSearch
        case CategorySearch
    }
    
    var currentViewType: CurrentViewType = .IngredientSearch
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("\(categorySearchBt.bounds.height) : \(categorySearchBt.frame.height)")
        
        let viewIndex = ViewManagerPlist.sharedInstance.getValueForKey("foodSearchIndex") as! Int
        
        let vc = (viewIndex == 0) ? IngredientsSearchVC() : CategorySearchVC()
        
        if(viewIndex == 0) {
            currentViewType = .IngredientSearch
            self.ingredientSearchSelectedButtonHighlight()
        } else {
            currentViewType = .CategorySearch
            self.categorySearchSelectedButtonHighlight()
        }
        
        // Do any additional setup after loading the view.
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        //let ratioWidth = ()
        let ratioHeight = (screenSize.height / vc.view.bounds.height)
        pageVC = UIPageViewController.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageVC.delegate = self
        pageVC.view.frame = CGRectMake(uiView.frame.origin.x, uiView.frame.origin.y, vc.view.bounds.width, vc.view.bounds.height * ratioHeight)
        pageVC.setViewControllers([vc], direction: .Forward, animated: true, completion: nil)
        self.addChildViewController(pageVC)
        pageVC.didMoveToParentViewController(self)
        self.uiView.addSubview(pageVC.view)
        
        scrollView.contentSize = CGSizeMake(vc.view.bounds.width, vc.view.bounds.height * ratioHeight)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ingredientsSearchBt(sender: AnyObject) {
        if (self.currentViewType == .IngredientSearch) {
            return
        }
        
        self.currentViewType = .IngredientSearch
        self.updateCurrentView()
    }
    
    func updateCurrentView() {
        var selectedBt = UIButton()
        var deselectedBt = UIButton()
        var vc = UIViewController()
        var index: Int
        
        switch self.currentViewType {
        case .IngredientSearch:
            self.ingredientSearchSelectedButtonHighlight()
            
            vc = IngredientsSearchVC()
            index = 0
        case .CategorySearch:
            self.categorySearchSelectedButtonHighlight()
            
            vc = CategorySearchVC()
            index = 1
        }
        
        ViewManagerPlist.sharedInstance.saveValue(index, forKey: "foodSearchIndex")
        pageVC.setViewControllers([vc], direction: .Forward, animated: false, completion: nil)
        
    }
    
    func ingredientSearchSelectedButtonHighlight() {
        ingredientsSearchBt.backgroundColor = UIColor.whiteColor()
        ingredientsSearchBt.setTitleColor(UIColor.colorFromHexString("#F7751E"), forState: .Normal)
        
        categorySearchBt.backgroundColor = UIColor.colorFromHexString("#F7751E")
        categorySearchBt.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    
    }
    
    func categorySearchSelectedButtonHighlight() {
        categorySearchBt.backgroundColor = UIColor.whiteColor()
        categorySearchBt.setTitleColor(UIColor.colorFromHexString("#F7751E"), forState: .Normal)
        
        ingredientsSearchBt.backgroundColor = UIColor.colorFromHexString("#F7751E")
        ingredientsSearchBt.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

    @IBAction func categorySearchBt(sender: AnyObject) {
        if (self.currentViewType == .CategorySearch) {
            return
        }
        
        self.currentViewType = .CategorySearch
        self.updateCurrentView()
    }

}
