//
//  GameController.swift
//  PartnerProgrammingGame
//
//  Created by Liz Parry on 8/16/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation
class GameController {
    
    //MARK: Properties
    private var userMoves: [Int] = []
    private(set) var correctMoves: [Int] = []
    
    //MARK: Moves Enum
    enum Move {
        case correctAndContinue
        case correctAndNewRound
        case incorrect
    }
    
    //MARK: Methods
    func userSelected(_ value: Int) -> Move {
        userMoves.append(value)
        if correctMoves.count == userMoves.count {
            if correctMoves == userMoves {
                createNextRound()
                return Move.correctAndNewRound
            } else {
                return Move.incorrect
            }
        } else {
            for number in 0..<userMoves.count {
                if correctMoves[number] != userMoves[number] {
                    print("Incorrect")
                    return Move.incorrect
                }
            }
            print("All moves so far are correct.")
            return Move.correctAndContinue
        }
    }
    //MARK Methods
    func createNextRound() {
        correctMoves.append(pickRandomNumberBetween0and3())
        userMoves = []
        print("Here's the correct answers: \(correctMoves)")
    }
    func startNewGame() {
    correctMoves = [pickRandomNumberBetween0and3(), pickRandomNumberBetween0and3(), pickRandomNumberBetween0and3()]
        userMoves = []
        print("Here's the correct answers: \(correctMoves)")
    }
    
    private func pickRandomNumberBetween0and3() -> Int {
        return Int(arc4random_uniform(4))
    }
}
