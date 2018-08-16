//
//  GameViewController.swift
//  PartnerProgrammingGame
//
//  Created by Zachary Frew on 8/16/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowView: UIButton!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Instance Properties
    var game = GameController()
    var isGameOver = false
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        game.startNewGame()
        showSequenceOfPresses()
    }
    
    // MARK: - Actions
    @IBAction func pinkButtonPressed(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    @IBAction func yellowButtonPressed(_ sender: UIButton) {
        buttonTapped(sender)
    }
    
    // MARK: - Instance Methods
    func buttonTapped(_ sender: UIButton) {
        if isGameOver {
            isGameOver = false
            displayLabel.text = ""
            game.startNewGame()
            showSequenceOfPresses()
        }
        
        let response = game.userSelected(sender.tag)
        switch response {
        case .correctAndContinue:
            show("Correct", after: 0)
        case .correctAndNewRound:
            show("Great job, time for a new round!", after: 0.5)
        case .incorrect:
            displayLabel.alpha = 1
            displayLabel.text = "You lost. Press any button to start again."
            isGameOver = true
        }
    }
    
    func showSequenceOfPresses() {
        view.isUserInteractionEnabled = false
        var count = 1.0
        
        for move in game.correctMoves {
            var colorAsString: String
            
            switch move {
            case 0:
                colorAsString = "pink"
            case 1:
                colorAsString = "blue"
            case 2:
                colorAsString = "green"
            case 3:
                colorAsString = "yellow"
            default:
                colorAsString = "white"
            }
            
            show(colorAsString, after: count)
            count += 1.0
        }
        
        view.isUserInteractionEnabled = true
    }
    
    func show(_ text: String, after delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.displayLabel.text = text
            self.displayLabel.alpha = 1.0
            UIView.animate(withDuration: 1.0, animations: {
                self.displayLabel.alpha = 0.0
            })
        }
    }

}

// MARK: - UIButton Extension - Gray-out buttons after being pressed
extension UIButton {
    
    open override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .lightGray : Constants.colors[self.tag]
        }
    }
}
