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
    
    @IBOutlet weak var rollButtonImage: UIButton!
    
    var diceNumber : Int = 0
    var numberOfRolls : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateRandomDiceImage()
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
        performSegue(withIdentifier: "nextView", sender: self)
    }
    
    //motion detector
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateRandomDiceImage()
            outputNumberOfRolls()
        }
    }
    
    


}

