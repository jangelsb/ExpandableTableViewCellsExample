//
//  TableViewOneController.swift
//  Expandable Cells Test
//
//  Created by Josh Angelsberg on 4/8/20.
//  Copyright © 2020 Josh Angelsberg. All rights reserved.
//

import UIKit

class TableViewReloadController: UITableViewController {
    
    var dataSource: [Bool] = (1...2).map { _ in false }
    
    // MARK: - <UITableViewDataSource>
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.row < 1 ? "ConstraintsCollapsibleCellId" : "StackViewCollapsibleCellId", for: indexPath)
        let shouldExpand = dataSource[indexPath.row]
        
        if let collapsibleCell = cell as? CollapsibleCell {
            collapsibleCell.updateUI(shouldExpand: shouldExpand)
        }
        
        return cell
    }
    
    
    // MARK: - <UITableViewDelegate>
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.setSelected(false, animated: true)
                
        dataSource[indexPath.row] = !dataSource[indexPath.row]
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
