//
//  File.swift
//  RockPaperScissorsApp
//
//  Created by Manali Rami on 2018-07-23.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import Foundation

// MARK: - RPSMatch

struct RPSMatch {
    
    // MARK: Properties
    
    let p1: RPS
    let p2: RPS
    let date: Date
    
    // MARSK: Initializer
    
    init(_ p1: RPS, _ p2: RPS) {
        
        self.p1 = p1
        self.p2 = p2
    }

    var winner: RPS {
        get {
            return p1 > p2 ? p1 : p2
            
        }
    }
    
    var loser: RPS {
        get {
            return p1 < p2 ? p1 : p2
            
        }
    }
}
