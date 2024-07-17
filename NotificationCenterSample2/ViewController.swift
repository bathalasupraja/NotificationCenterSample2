//
//  ViewController.swift
//  NotificationCenterSample2
//
//  Created by Supraja on 29/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fistContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var thirdContainerView: UIView!
    @IBOutlet weak var fourthContainerView: UIView!
    @IBOutlet weak var coloursView: UIView!
    @IBOutlet weak var colourButtonOne: UIButton!
    @IBOutlet weak var colourButtonTwo: UIButton!
    @IBOutlet weak var colourButtonThree: UIButton!
    @IBOutlet weak var colourButtonFour: UIButton!
    @IBOutlet weak var colourButtonFive: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        colourButtonOne.layer.cornerRadius = 20
        colourButtonOne.backgroundColor = UIColor.systemCyan
        colourButtonOne.layer.masksToBounds = true
        
        colourButtonTwo.layer.cornerRadius = 20
        colourButtonTwo.backgroundColor = UIColor.systemPink
        colourButtonTwo.layer.masksToBounds = true
        
        colourButtonThree.layer.cornerRadius = 20
        colourButtonThree.backgroundColor = UIColor.systemBrown
        colourButtonThree.layer.masksToBounds = true
        
        colourButtonFour.layer.cornerRadius = 20
        colourButtonFour.backgroundColor = UIColor.systemOrange
        colourButtonFour.layer.masksToBounds = true
        
        colourButtonFive.layer.cornerRadius = 20
        colourButtonFive.backgroundColor = UIColor.systemGray
        colourButtonFive.layer.masksToBounds = true
        
        fistContainerView.layer.cornerRadius = 3
        fistContainerView.layer.borderWidth = 1
        fistContainerView.layer.borderColor = UIColor.brown.cgColor
        fistContainerView.layer.masksToBounds = true
        
        secondContainerView.layer.cornerRadius = 3
        secondContainerView.layer.borderWidth = 1
        secondContainerView.layer.borderColor = UIColor.brown.cgColor
        secondContainerView.layer.masksToBounds = true
        
        thirdContainerView.layer.cornerRadius = 3
        thirdContainerView.layer.borderWidth = 1
        thirdContainerView.layer.borderColor = UIColor.brown.cgColor
        thirdContainerView.layer.masksToBounds = true
        
        fourthContainerView.layer.cornerRadius = 3
        fourthContainerView.layer.borderWidth = 1
        fourthContainerView.layer.borderColor = UIColor.brown.cgColor
        fourthContainerView.layer.masksToBounds = true
        
        
        /// Add FirstController to fistContainerView
        if let controller = FirstViewController.create() {
            addChild(controller)
            controller.didMove(toParent: self)
            controller.view.frame = fistContainerView.bounds
            fistContainerView.addSubview(controller.view)
        }
        
        /// Add SecondController to secondContainerView
        if let controller = SecondViewController.create() {
            addChild(controller)
            controller.didMove(toParent: self)
            controller.view.frame = secondContainerView.bounds
            secondContainerView.addSubview(controller.view)
        }
        
        /// Add ThirdController to thirdContainerView
        if let controller = ThirdViewController.create() {
            addChild(controller)
            controller.didMove(toParent: self)
            controller.view.frame = thirdContainerView.bounds
            thirdContainerView.addSubview(controller.view)
        }
        
        /// Add Fourth Controller to fourthContainerView
        if let controller = FourthViewController.create() {
            addChild(controller)
            controller.didMove(toParent: self)
            controller.view.frame = fourthContainerView.bounds
            fourthContainerView.addSubview(controller.view)
        }
    }
    
    @IBAction func didTouchFirstColor(_ sender: UIButton) {
        if let colour = sender.backgroundColor {
            Manager.shared.sendColour(colour)
        }
    }
    
    @IBAction func didTouchSecondColor(_ sender: UIButton) {
        if let colour = sender.backgroundColor {
            Manager.shared.sendColour(colour)
        }
    }
    
    @IBAction func didTouchThirdColor(_ sender: UIButton) {
        if let colour = sender.backgroundColor {
            Manager.shared.sendColour(colour)
        }
    }
    
    @IBAction func didTouchFourthColor(_ sender: UIButton) {
        if let colour = sender.backgroundColor {
            Manager.shared.sendColour(colour)
        }
    }
    
    @IBAction func didTouchFifthColor(_ sender: UIButton) {
        if let colour = sender.backgroundColor {
            Manager.shared.sendColour(colour)
        }
    }
}

