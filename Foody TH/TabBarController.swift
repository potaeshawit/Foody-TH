//
//  TabBarController.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/11/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var tabVC1: HomeVC?
    var tabVC2: CreateMenuVC?
    var tabVC3: RandomVC?
    var tabVC4: FoodSearchVC?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //init tabBarItems
        self.tabVC1 = HomeVC()
        self.tabVC2 = CreateMenuVC()
        self.tabVC3 = RandomVC()
        self.tabVC4 = FoodSearchVC()
        
        self.viewControllers = [tabVC1!, tabVC2!, tabVC3!, tabVC4!]
        let vc1 = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        let vc2 = UITabBarItem(title: "", image: UIImage(named: "plus"), tag: 1)
        let vc3 = UITabBarItem(title: "", image: UIImage(named: "dice"), tag: 2)
        let vc4 = UITabBarItem(title: "", image: UIImage(named: "chef"), tag: 3)
        
        self.tabVC1?.tabBarItem = vc1
        self.tabVC2?.tabBarItem = vc2
        self.tabVC3?.tabBarItem = vc3
        self.tabVC4?.tabBarItem = vc4
        
        self.tabVC1?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC2?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC3?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC4?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        self.tabBar.tintColor = UIColor.colorFromHexString("#F7751E")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
