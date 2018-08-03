//
//  ViewController2ViewController.swift
//  DiceeV2
//
//  Created by austin_gae on 8/2/18.
//  Copyright © 2018 Austin Gae. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var magicBallImage: UIImageView!
    
    var randomNumber : Int = 0;
    
    var ball = ["ball1","ball2","ball3","ball4","ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askButton(_ sender: Any) {
        randomNumber = Int(arc4random_uniform(5))
        magicBallImage.image = UIImage(named: ball[randomNumber])
    }
    
    @IBAction func goBackToDicee(_ sender: Any) {
        performSegue(withIdentifier: "diceeView", sender: self)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            askButton(self)
        }
    }

}
