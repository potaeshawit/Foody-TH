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
    var tabVC2_1: CreateMenuNotRgeistered?
    var tabVC3: RandomVC?
    var tabVC4: FoodSearchVC?

    var currentPage = "หน้าหลัก"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //NavBar
        
    }
    
    override func viewWillAppear(animated: Bool) {

        //init Navigation Bar
        initNavBar()
        
        //init tabBarItems
        initTabBarItems()
        
    }
    
    func initNavBar() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        //print(self.navigationController)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.origin.y)!, screenSize.width, 45)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.colorFromHexString("#f7751e")), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        //self.view.backgroundColor = UIColor.colorFromHexString("#1f443c")
        self.title = currentPage
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //hamburger
        let menuBtn = UIBarButtonItem()
        menuBtn.image = UIImage(named: "hamburger_icon")
        menuBtn.style = .Plain
        
        let leftSlideMenu = LeftSlideMenuVC()
        menuBtn.target = leftSlideMenu
        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        

        navigationItem.leftBarButtonItem = menuBtn
    
    }
    
    func OpenLeftMenu(sender: AnyObject) {
        //let sideMenuVC = SideMenuVC()
        print("Badoo")
    }
    
    func initTabBarItems() {
        
        //let loginState = ViewManagerPlist.sharedInstance.getValueForKey("loginState") as! Bool

        let loginState = false
        print(loginState)
        
        self.tabVC1 = HomeVC()
        self.tabVC3 = RandomVC()
        self.tabVC4 = FoodSearchVC()
        
        if(loginState == false) {
            self.tabVC2_1 = CreateMenuNotRgeistered()
            self.viewControllers = [tabVC1!, tabVC2_1!, tabVC3!, tabVC4!]
            
        } else if(loginState == true) {
            self.tabVC2 = CreateMenuVC()
            self.viewControllers = [tabVC1!, tabVC2!, tabVC3!, tabVC4!]
        }
        
        
        let vc1 = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        let vc2 = UITabBarItem(title: "", image: UIImage(named: "plus"), tag: 1)
        let vc3 = UITabBarItem(title: "", image: UIImage(named: "dice"), tag: 2)
        let vc4 = UITabBarItem(title: "", image: UIImage(named: "chef"), tag: 3)
        
        self.tabVC1?.tabBarItem = vc1
        self.tabVC2?.tabBarItem = vc2
        self.tabVC2_1?.tabBarItem = vc2
        self.tabVC3?.tabBarItem = vc3
        self.tabVC4?.tabBarItem = vc4
        
        self.tabVC1?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC2?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC2_1?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC3?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.tabVC4?.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        self.tabBar.tintColor = UIColor.colorFromHexString("#F7751E")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch(item.tag) {
        case 0:
            self.title = "หน้าหลัก"
            currentPage = "หน้าหลัก"
            break
        case 1:
            self.title = "สร้างเมนู"
            currentPage = "สร้างเมนู"
            break
        case 2:
            self.title = "สุ่มอาหาร"
            currentPage = "สุ่มอาหาร"
            break
        case 3:
            self.title = "ค้นหาอาหาร"
            currentPage = "ค้นหาอาหาร"
            break
        default:
            break
        
        }
    }

}
