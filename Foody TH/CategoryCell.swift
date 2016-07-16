//
//  CategoryCell.swift
//  Foody TH
//
//  Created by Layle <3 ~~~ on 7/12/2559 BE.
//  Copyright © 2559 Achiraya Klinpipat. All rights reserved.
//

import UIKit

protocol CategoryCellDelegate {
    func categoryCellDidTouchUpInside(cell: UITableViewCell, index: Int)
}

class CategoryCell: UITableViewCell {
    
    @IBOutlet var buttonView: UIButton!
    var delegate: CategoryCellDelegate?
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(index: Int) {
        //normal mai normal
        buttonView.setBackgroundImage(UIImage(named: "type_\(index)"), forState: .Normal)
        buttonView.setBackgroundImage(UIImage(named: "type_\(index)_clicked"), forState: .Highlighted)
        self.index = index
    }
    
    @IBAction func didTouchUpAction(sender: UIButton) {
        if delegate != nil {
            delegate?.categoryCellDidTouchUpInside(self, index: index)
        }
    }
    
    
    
}
