//
//  RPS.swift
//  RockPaperScissorsApp
//
//  Created by Manali Rami on 2018-07-22.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import Foundation

// MARK: -RPS: Comparable

enum RPS: Comparable {
    case rock, paper, scissor
    
    init() {
        switch arc4random() % 3 {
            
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissor
        }
    }
}

// MARK: - RPS (Comparison)

func <(lhs: RPS, rhs: RPS) -> Bool {
    
    switch (lhs, rhs) {
    case (.rock, .paper), (.paper, .scissor), (.scissor, .rock):
        return true;
    default:
        return false;
    }
}

// Mark: - RPS: CustomStringConvertible

extension RPS: CustomStringConvertible {
    var description: String {
        get {
            switch (self) {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissor:
                return "Scissor"
            }
        }
    }
}
