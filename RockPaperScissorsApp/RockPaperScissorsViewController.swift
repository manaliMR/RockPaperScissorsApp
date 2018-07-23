//
//  RockPaperScissorsViewController.swift
//  RockPaperScissorsApp
//
//  Created by Manali Rami on 2018-07-22.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import UIKit

class RockPaperScissorViewController: UIViewController {

    var match: RPSMatch!
    
    // MARK: Outlets
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func makeYourMove(_ sender: UIButton) {
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.rock)
            
        case self.paperButton:
            throwDown(RPS.paper)
            
        case self.scissorButton:
            throwDown(RPS.scissor)
            
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
            
        }
    }
    // MARK: Segue
    override func  prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        // code works for both Scissor and Paper
        let controller = segue.destination as! ResultViewController
        controller.match = self.match
    }
    
    // MARK: Play!
    func throwDown(_ playersMove: RPS){
        let computersMove = RPS()
        self.match = RPSMatch(playersMove, computersMove)
        
        // Here are the 3 ways of presenting a View Controller
        
        // 1st Way: Programmatic View Controller Presentation
        if (playersMove == RPS.rock) {
            // Get the storyboard and ResultViewController
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewController(withIdentifier: "Result View Controller")as! ResultViewController
            // Communicate the match
            resultVC.match = self.match
            self.present(resultVC, animated: true, completion: nil)
        }
            // 2nd Way: Code plus Segue
        else if (playersMove == RPS.paper) {
            performSegue(withIdentifier: "throwDownPaper", sender: self)
        }
        // 3rd Way: Segue Only, No code!
        
    }
}


