//
//  ViewController.swift
//  DiceeV2
//
//  Created by austin_gae on 8/2/18.
//  Copyright © 2018 Austin Gae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage: UIImageView!
    
    @IBOutlet weak var numOfRollsLabel: UILabel!
    @IBOutlet weak var diceeGeneratorLabel: UILabel!
    
    @IBOutlet weak var goToFortuneTellerButton: UIButton!
    @IBOutlet weak var rollDiceButton: UIButton!
    
    var diceNumber : Int = 0
    var numberOfRolls : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderDesign()
        updateRandomDiceImage()
    }
    
    func borderDesign() {
        //Button Design
        goToFortuneTellerButton.layer.borderWidth = 1.0
        goToFortuneTellerButton.layer.borderColor = UIColor.black.cgColor
        goToFortuneTellerButton.layer.cornerRadius = 10.0
        
        rollDiceButton.layer.borderWidth = 1.0
        rollDiceButton.layer.borderColor = UIColor.yellow.cgColor
        rollDiceButton.layer.cornerRadius = 10.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //changes the dice image if button is pressed
    @IBAction func rollButton(_ sender: UIButton) {
        updateRandomDiceImage()
        outputNumberOfRolls()
    }
    
    func updateRandomDiceImage() {
        diceNumber = Int(arc4random_uniform(6) + 1)
        
        diceImage.image = UIImage(named: "dice" + String(diceNumber))
    }
    func outputNumberOfRolls() {
        numberOfRolls = numberOfRolls + 1
        
        numOfRollsLabel.text = String(numberOfRolls)
    }
    
    //going to the next view
    @IBAction func optionalButton(_ sender: Any) {
        performSegue(withIdentifier: "magic8BallView", sender: self)
    }
    
    //motion detector
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateRandomDiceImage()
            outputNumberOfRolls()
        }
    }
    
    


}

