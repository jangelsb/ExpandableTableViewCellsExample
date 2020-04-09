//
//  CollapsibleTableViewCell.swift
//  Expandable Cells Test
//
//  Created by Josh Angelsberg on 4/8/20.
//  Copyright © 2020 Josh Angelsberg. All rights reserved.
//

import UIKit

protocol CollapsibleCell {
    func updateUI(shouldExpand: Bool)
}

class CollapsibleTableViewCell: UITableViewCell, CollapsibleCell {
    
    let animationDuration = 0.3
    let piOverTwo = CGFloat(Double.pi/2.0)

    @IBOutlet var chevronImageView: UIImageView?
    @IBOutlet var expandedView: UIView!
    @IBOutlet var expandedConstraint: NSLayoutConstraint!
    @IBOutlet var collapsedConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateForUserInterfaceStyle()
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        updateForUserInterfaceStyle()
    }
    
    func updateForUserInterfaceStyle() {
        if #available(iOS 12.0, *), traitCollection.userInterfaceStyle == .dark {
            chevronImageView?.tintColor = .white
        } else {
            chevronImageView?.tintColor = .black
        }
    }
    
    func updateUI(shouldExpand: Bool) {
        UIView.animate(withDuration: animationDuration) {
            self.chevronImageView?.transform = shouldExpand ? CGAffineTransform(rotationAngle: self.piOverTwo) : .identity
            self.expandedView.alpha = shouldExpand ? 1.0 : 0.0
        }
        
        self.expandedConstraint.isActive = shouldExpand
        self.collapsedConstraint.isActive = !shouldExpand
    }
}

class PersonCardCollapsibleTableViewCell: CollapsibleTableViewCell {
    
    @IBOutlet var personLabel: UILabel!
    @IBOutlet var personCostLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var requestButton: UIButton!
}
