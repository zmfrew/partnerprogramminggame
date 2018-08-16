//
//  SplashScreenViewController.swift
//  PartnerProgrammingGame
//
//  Created by Zachary Frew on 8/16/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var yellowView: UIView!
        
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpSplashView()
    }

    // MARK: - Instance Methods
    func setUpSplashView() {
        setUpViews()
        setUpButton()
    }
    
    func setUpViews() {
        animatePinkView()
        animateBlueView()
        animateGreenView()
        animateYellowView()
    }
    
    func setUpButton() {
        playButton.layer.cornerRadius = playButton.bounds.height/2
        playButton.layer.borderColor = UIColor.darkGray.cgColor
        playButton.layer.borderWidth = 10.0
        playButton.layer.shadowColor = UIColor(red: 255/255, green: 251/255, blue: 0/255, alpha: 1).cgColor
        playButton.layer.shadowRadius = 10.0
        playButton.layer.shadowOpacity = 1.0
    }
    
    func animatePinkView() {
        pinkView.layer.cornerRadius = 10.0

        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.repeat, .curveEaseOut], animations: {
            self.pinkView.center = CGPoint(x: self.pinkView.center.x - self.view.bounds.width, y: self.pinkView.center.y)
            self.pinkView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.2, options: [.repeat, .curveLinear], animations: {
            self.pinkView.center = CGPoint(x: self.pinkView.center.x + self.view.bounds.width, y: self.pinkView.center.y + 50)
        }, completion: nil)
        
    }
    
    func animateBlueView() {
        blueView.layer.cornerRadius = 10.0
        
        UIView.animate(withDuration: 1.0, delay: 0.2, options: [.repeat, .curveLinear], animations: {
            self.blueView.center = CGPoint(x: self.blueView.center.x + self.view.bounds.width, y: self.blueView.center.y)
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0.3, options: [.repeat, .curveEaseOut], animations: {
            self.blueView.center = CGPoint(x: self.blueView.center.x - self.view.bounds.width, y: self.blueView.center.y)
            self.blueView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: nil)
    }
    
    func animateGreenView() {
        greenView.layer.cornerRadius = 10.0
        
        UIView.animate(withDuration: 2.0, delay: 0.3, options: [.repeat, .curveEaseOut], animations: {
            self.greenView.center = CGPoint(x: self.greenView.center.x - self.view.bounds.width, y: self.greenView.center.y)
            self.greenView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: nil)

        UIView.animate(withDuration: 1.0, delay: 0.2, options: [.repeat, .curveLinear], animations: {
            self.greenView.center = CGPoint(x: self.greenView.center.x + self.view.bounds.width, y: self.greenView.center.y + 150)
        }, completion: nil)

    }
    
    func animateYellowView() {
        yellowView.layer.cornerRadius = 10.0
        
        UIView.animateKeyframes(withDuration: 4.0, delay: 0.1, options: [.repeat, .autoreverse], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.yellowView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.yellowView.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.yellowView.center = CGPoint(x: self.yellowView.center.x + 0.5 * self.view.bounds.width, y: self.yellowView.center.y - 600)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.yellowView.center = CGPoint(x: self.yellowView.center.x - 0.25 * self.view.bounds.width, y: self.yellowView.center.y + 500)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                self.yellowView.center = CGPoint(x: self.yellowView.center.x + 0.25 * self.view.bounds.width, y: self.yellowView.center.y - 150)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.70, relativeDuration: 0.25, animations: {
                self.yellowView.center = CGPoint(x: self.yellowView.center.x + 0.25 * self.view.bounds.width, y: self.yellowView.center.y + 100)
            })
            
        }, completion: nil)
    }
    
}
