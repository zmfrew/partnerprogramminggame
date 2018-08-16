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
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Instance Properties
    var game = GameController()
    var isGameOver = false
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton(pinkButton)
        setUpButton(blueButton)
        setUpButton(greenButton)
        setUpButton(yellowButton)
        
        blackView.layer.cornerRadius = 10.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        game.startNewGame()
        showSequenceOfPresses()
    }
    
    // MARK: - Actions
    @IBAction func pinkButtonTapped(_ sender: UIButton) {
        flashGray(pinkButton, color: Constants.pink)
        
        buttonTapped(sender, index: 0)
        
    }
    
    
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        flashGray(blueButton, color: Constants.blue)
        buttonTapped(sender, index: 1)
    }
    
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        flashGray(greenButton, color: Constants.green)
        buttonTapped(sender, index: 2)
    }
    
    
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        flashGray(yellowButton, color: Constants.yellow)
        buttonTapped(sender, index: 3)
    }
    
    // MARK: - Instance Methods
    func setUpButton(_ button: UIButton) {
        button.layer.cornerRadius = 10.0
    }
    
    func buttonTapped(_ sender: UIButton, index: Int) {
        if isGameOver {
            isGameOver = false
            displayLabel.text = ""
            game.startNewGame()
            showSequenceOfPresses()
        }
        
        let response = game.userSelected(index)
        
        switch response {
        case .correctAndContinue:
            show("Correct", after: 0)
        case .correctAndNewRound:
            show("Correct, time for new round", after: 0)
            showSequenceOfPresses()
        case .incorrect:
            displayLabel.alpha = 1
            displayLabel.text = "You lost. Press any button to start again"
            isGameOver = true
        }
    }
    
    func showSequenceOfPresses() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.pinkButton.isEnabled = false
            self.blueButton.isEnabled = false
            self.greenButton.isEnabled = false
            self.yellowButton.isEnabled = false
        }
        
        
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
                colorAsString = "unknown"
            }
            
            show(colorAsString, after: count)
            count += 1.0
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.pinkButton.isEnabled = true
            self.blueButton.isEnabled = true
            self.greenButton.isEnabled = true
            self.yellowButton.isEnabled = true
        }
        
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
    
    func flashGray(_ button: UIButton, color: UIColor) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.05, animations: {
                button.backgroundColor = UIColor.lightGray
            })
        }
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.05, animations: {
                button.backgroundColor = color
            })
        }
    }
    
}
