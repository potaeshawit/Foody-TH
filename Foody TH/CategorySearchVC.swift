//
//  CategorySearchVC.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/12/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

class CategorySearchVC: BaseViewController, UITableViewDelegate, UITableViewDataSource, CategoryCellDelegate {

    let categoryData = ["1", "2", "3", "4", "5", "6", "7"]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nibName = UINib(nibName: "CategoryCell", bundle: nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "categoryCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 107 * 1.29
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! CategoryCell
        // indexPath.item
        cell.delegate = self
        cell.commonInit(indexPath.item)
        return cell
    }
    
    func categoryCellDidTouchUpInside(cell: UITableViewCell, index: Int) {
        let catCell = cell as! CategoryCell
        //print(catCell.index)
        let vc = MenuList()
        switch(catCell.index) {
        case 0:
            vc.foodType = "ต้ม"
            break
        case 1:
            vc.foodType = "ผัด"
            break
        case 2:
            vc.foodType = "แกง"
            break
        case 3:
            vc.foodType = "ทอด"
            break
        case 4:
            vc.foodType = "นึ่ง"
            break
        case 5:
            vc.foodType = "ปิ้ง-ย่าง"
            break
        case 6:
            vc.foodType = "สลัด"
            break
        default:
            break
        }
        self.pushVC(vc)
    }
    

}
