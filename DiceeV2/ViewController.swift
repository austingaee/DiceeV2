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
    
    @IBOutlet weak var rollButtonImage: UIButton!
    @IBOutlet weak var optionalButtonImage: UIButton!
    @IBOutlet weak var goBackButtonImage: UIButton!
    
    var diceNumber : Int = 0
    var numberOfRolls : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateRandomDiceImage()
        
        //initially hides the goBackButtonImage
        self.goBackButtonImage.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //changes the dice image if button is pressed
    @IBAction func rollButton(_ sender: UIButton) {
        updateRandomDiceImage()
        
        numberOfRolls = numberOfRolls + 1
        numOfRollsLabel.text = String(numberOfRolls)
    }
    
    func updateRandomDiceImage() {
        diceNumber = Int(arc4random_uniform(6) + 1)
        diceImage.image = UIImage(named: "dice" + String(diceNumber))
    }
    
    // optionalButton is hidden when goBackButton is pressed & vice versa
    @IBAction func optionalButton(_ sender: Any) {
        self.optionalButtonImage.isHidden = true
        self.goBackButtonImage.isHidden = false;
    }
    @IBAction func goBackButton(_ sender: Any) {
        self.goBackButtonImage.isHidden = true;
        self.optionalButtonImage.isHidden = false;
    }
    //
}

