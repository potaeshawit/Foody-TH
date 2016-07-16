//
//  IngredientsCell.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/16/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

protocol IngredientCellDelegate {
    func foodCellDidSelected(cell: UITableViewCell, ingdName: String, index: Int, selected: Bool)
}

class IngredientsCell: UITableViewCell {

    @IBOutlet var ingredientName: UILabel!
    
    @IBOutlet var checkBt: UIButton!
    
    var ingdName: String = ""
    var ingdIndex: Int = 0
    var isSelectedIngd: Bool = false
    
    var delegate: IngredientCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ingredientName.text = ingdName
        if(isSelectedIngd) {
            checkBt.setImage(UIImage(named: "selected_bt.png"), forState: .Normal)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(name: String, index: Int, selected: Bool) {
        ingdName = name
        ingdIndex = index
        isSelectedIngd = selected
    }
    
    @IBAction func checkBtAction(sender: AnyObject) {
        if(isSelectedIngd) {
            checkBt.setImage(UIImage(named: "unselected_bt.png"), forState: .Normal)
            isSelectedIngd = false
            if(delegate != nil) {
                delegate?.foodCellDidSelected(self, ingdName: ingdName, index: ingdIndex, selected: isSelectedIngd)
            }
        } else if(!isSelectedIngd) {
            checkBt.setImage(UIImage(named: "selected_bt.png"), forState: .Normal)
            isSelectedIngd = true
        }
    }
}
