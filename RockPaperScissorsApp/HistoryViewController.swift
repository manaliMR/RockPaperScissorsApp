//
//  HistoryViewController.swift
//  RockPaperScissorsApp
//
//  Created by Manali Rami on 2018-07-24.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import Foundation
import UIKit


// MARK: - HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    var history: [RPSMatch]!
    
    // MARK: Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Table View Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        
        let match = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = victoryStatusDescription(match)
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        
        return cell
    }
    
    func victoryStatusDescription(_ match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "It's a Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Player1 : Wins, Player2 : losses"
        } else {
            return "Player1 : Losses, Player2 : Wins"
        }
    }
    
    // MARK: Actions
    
    @IBAction func dismissHistory(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}



