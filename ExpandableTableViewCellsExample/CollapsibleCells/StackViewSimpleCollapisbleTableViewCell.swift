//
//  StackViewSimpleCollapisbleTableViewCell.swift
//  ExpandableTableViewCellsExample
//
//  Created by Josh Angelsberg on 4/11/20.
//  Copyright © 2020 Josh Angelsberg. All rights reserved.
//

import UIKit

class StackViewSimpleCollapisbleTableViewCell: CollapsibleBaseCell {

    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var seeMoreLabel: UILabel!
    
    override func updateUI(shouldExpand: Bool) {
        
        self.descriptionLabel.numberOfLines = shouldExpand ? 0 : 3
        self.descriptionLabel.layoutIfNeeded()
        
        seeMoreLabel.text = shouldExpand ? "See less" : "See more"
    }
}
