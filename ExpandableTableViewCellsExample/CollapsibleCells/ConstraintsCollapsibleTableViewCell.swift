//
//  CollapsibleTableViewCell.swift
//  Expandable Cells Test
//
//  Created by Josh Angelsberg on 4/8/20.
//  Copyright © 2020 Josh Angelsberg. All rights reserved.
//

import UIKit

class ConstraintsCollapsibleBaseTableViewCell: CollapsibleBaseCell {

    @IBOutlet var expandedView: UIView!
    @IBOutlet var expandedConstraint: NSLayoutConstraint!
    @IBOutlet var collapsedConstraint: NSLayoutConstraint!
    
    override func updateUI(shouldExpand: Bool) {
        UIView.animate(withDuration: animationDuration) {
            self.chevronImageView?.transform = shouldExpand ? CGAffineTransform(rotationAngle: self.chevronRotationAngle) : .identity
            self.expandedView.alpha = shouldExpand ? 1.0 : 0.0
        }
        
        self.expandedConstraint.isActive = shouldExpand
        self.collapsedConstraint.isActive = !shouldExpand
    }
}

class ConstraintsCollapsibleExampleTableViewCell: ConstraintsCollapsibleBaseTableViewCell {
    
    @IBOutlet var personLabel: UILabel!
    @IBOutlet var personCostLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var requestButton: UIButton!
}
