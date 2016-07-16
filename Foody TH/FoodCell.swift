//
//  FoodCell.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/13/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

protocol FoodCellDelegate {
    func foodCellDidTouchUpInside(cell: UITableViewCell, url: String, foodname: String, foodDetail : Dictionary<String, AnyObject>)
}

class FoodCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var food_lbl: UILabel!
    
    var url : String = ""
    var foodName : String = ""
    
    var foodDetail : Dictionary<String, AnyObject>!
    
    var delegate: FoodCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(url: String, foodName: String, foodDetail : Dictionary<String, AnyObject>) {
        self.url = url
        LoadImage.loadImageFromUrl(url, view: self.imgView)
        self.foodName = foodName
        
        food_lbl.text = foodName
        
        self.foodDetail = foodDetail

    }
    
    @IBAction func foodAction(sender: AnyObject) {
        if delegate != nil {
            delegate?.foodCellDidTouchUpInside(self, url: url, foodname: foodName, foodDetail : foodDetail)
        }
    }
}
