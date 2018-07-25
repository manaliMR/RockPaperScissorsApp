//
//  ResultViewController.swift
//  RockPaperScissorsApp
//
//  Created by Manali Rami on 2018-07-22.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Properties
    
    var match: RPSMatch!
    var message: NSString!
    var picture: UIImage!
    
    //MARK: Outlets
    
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.messageLabel.text = messageForMatch(match)
        self.resultImageView.image = imageForMtach(match)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration:1.5) {
            self.resultImageView.alpha = 1;
        }
    }
    
    // MARK: Actions
    
    @IBAction func playAgainButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Messages For Match
    
    func messageForMatch(_ match: RPSMatch) -> String {
        
        if match.p1 == match.p2 {
            return "It's a tie"
        }
        
        return match.winner.description + "  " + victoryModeString(match.winner) + "  " + match.loser.description + ". " + resultString(match)
        }
    func resultString(_ match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    func victoryModeString(_ gesture: RPS) -> String {
        switch (gesture) {
        case .rock:
            return "crushes"
        case .scissor:
            return "cuts"
        case .paper:
            return "covers"
        }
        
     }
    
    // MARK: Image for Match
   
    func imageForMtach(_ match: RPSMatch) -> UIImage {
        
        var name = " "
        
        switch (match.winner) {
        case .rock:
            name = "PockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissor:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "It's a tie"
        }
        
        return UIImage(named: name)!
    }
}
