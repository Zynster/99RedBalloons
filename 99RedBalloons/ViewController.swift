//
//  ViewController.swift
//  99RedBalloons
//
//  Created by DorianDowse on 30/10/2014.
//  Copyright (c) 2014 Xenoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Properties
    @IBOutlet weak var imagePlaceholder: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    var balloons:[Balloon] = []
    var currentIndex = 0
    
    // On Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageBank = ["RedBalloon1.jpg","RedBalloon2.jpg","RedBalloon3.jpg","RedBalloon4.jpg"]
        for var i=1; i<100; i++ {
            var aBalloon = Balloon()
            aBalloon.aNumber = i
            aBalloon.anImage = imageBank[rnd(4)]
            //aBalloon.anImage = UIImage(named:imageBank[rnd(4)])
            balloons.append(aBalloon)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button Action
    @IBAction func nextButton(sender: UIBarButtonItem) {
        
        // Show Label
        if imageLabel.hidden {
            imageLabel.hidden = false
        }
        
        // Generate a new random index
        var randomIndex: Int
        do {
        randomIndex = rnd(99)
        } while randomIndex == currentIndex || balloons[currentIndex].anImage == balloons[randomIndex].anImage
        currentIndex = randomIndex
        
        // Display new balloon
        imagePlaceholder.image  = UIImage(named:balloons[currentIndex].anImage)
        imageLabel.text = "\(balloons[currentIndex].aNumber)"
        
    }
    
    // Random func
    func rnd(num:Int) -> Int {
        var aNumber = Int(arc4random_uniform(UInt32(num)))
        return aNumber
    }
    


}

