//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Yi Chen on 12/25/14.
//  Copyright (c) 2014 YC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //hiiiiiiiii
    @IBOutlet weak var totalMoneyMade: UILabel!
    
    @IBOutlet weak var totalIceContain: UILabel!
    
    @IBOutlet weak var totalLemonContain: UILabel!
    
    
    @IBOutlet weak var waitingToRespondLabel: UILabel!
    
    
    @IBOutlet weak var numberOfVisitorPurchasedLabel: UILabel!
    
    @IBOutlet weak var numberOfVisitorLabel: UILabel!
    

    @IBOutlet weak var weatherImage: UIImageView!
    
    
    
    @IBOutlet weak var lemonMixNumberLabel: UILabel!
    
    
    @IBOutlet weak var purchaseIceLabel: UILabel!
    
    @IBOutlet weak var purchaseLemonLabel: UILabel!
    
    @IBOutlet weak var lemonUsedThisRound: UILabel!
    
    @IBOutlet weak var iceUsedThisRound: UILabel!
    
    @IBOutlet weak var iceLemonRatioThisRound: UILabel!
    
    //Mix Ice
    @IBOutlet weak var iceMixNumberLabel: UILabel!
    
    //Mix stepper
    @IBOutlet weak var mixLemonSteper: UIStepper!
    @IBOutlet weak var mixIceSteper: UIStepper!
    
    //purchase stepper
    
    @IBOutlet weak var purchaseIceStepper: UIStepper!
    @IBOutlet weak var purchaseLemonStepper: UIStepper!
    
    
    @IBOutlet weak var totalMoneySpendLabel: UILabel!
    
    @IBOutlet weak var iceLemonRatio: UILabel!
    
    
    var todaysWeather:Weather = Weather(todaysWeather: "Warm", weatherImage: UIImage(named: "Warm"))
    
    var totalNumberOfLemonSold:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpStepperButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func mixIceSteperButton(sender: UIStepper) {
        self.iceMixNumberLabel.text = Int(sender.value).description
        var radio:Double = 0.0
        if self.iceMixNumberLabel.text!.toInt()! == 0 {
            var myRatio:String = NSString(format: "%.01f", Double(self.lemonMixNumberLabel.text!.toInt()!)*100)
            self.iceLemonRatio.text = myRatio + "%"

        } else {
            var myRatio:String = NSString(format: "%.01f", Double(self.lemonMixNumberLabel.text!.toInt()!)*100/Double(self.iceMixNumberLabel.text!.toInt()!))
            self.iceLemonRatio.text = myRatio + "%"
        }
    }
    
    @IBAction func mixLemonSteperButton(sender: UIStepper) {
        self.lemonMixNumberLabel.text = Int(sender.value).description
        if self.iceMixNumberLabel.text!.toInt()! == 0 {
            var myRatio:String = NSString(format: "%.01f", Double(self.lemonMixNumberLabel.text!.toInt()!)*100)
             self.iceLemonRatio.text = myRatio + "%"
        } else {
            var myRatio:String = NSString(format: "%.01f", Double(self.lemonMixNumberLabel.text!.toInt()!)*100/Double(self.iceMixNumberLabel.text!.toInt()!))
            self.iceLemonRatio.text = myRatio + "%"
        }
    }
 
    @IBAction func purchaseIceStepperPressed(sender: UIStepper) {
        self.purchaseIceLabel.text = Int(sender.value).description
        self.totalMoneySpendLabel.text
            = "\(self.purchaseIceLabel.text!.toInt()! + self.purchaseLemonLabel.text!.toInt()! * 2)"
    }
    
    @IBAction func purchaseLemonStepperPressed(sender: UIStepper) {
        self.purchaseLemonLabel.text = Int(sender.value).description
        self.totalMoneySpendLabel.text
            = "\(self.purchaseIceLabel.text!.toInt()! + self.purchaseLemonLabel.text!.toInt()! * 2)"
    }
    
    @IBAction func purchaseButtonPress(sender: UIButton) {
        if totalMoneySpendLabel.text!.toInt()! <= totalMoneyMade.text!.toInt()! {
            totalMoneyMade.text = "\(totalMoneyMade.text!.toInt()! - totalMoneySpendLabel.text!.toInt()!)"
            totalIceContain.text = "\(totalIceContain.text!.toInt()! + purchaseIceLabel.text!.toInt()!)"
            totalLemonContain.text = "\(totalLemonContain.text!.toInt()! + purchaseLemonLabel.text!.toInt()!)"
            self.purchaseLemonLabel.text = "0"
            self.purchaseIceLabel.text = "0"
            self.totalMoneySpendLabel.text = "0"
            self.purchaseIceStepper.value = 0.0
            self.purchaseLemonStepper.value = 0.0
        } else {
            showAlertWithTest(header: "Not enough money", message: "You need to but less money...")
        }
    }
    
    
    @IBAction func mixButtonPress(sender: UIButton) {
        if (self.iceMixNumberLabel.text!.toInt()! <= self.totalIceContain.text!.toInt()! && self.lemonMixNumberLabel.text!.toInt()! <= self.totalLemonContain.text!.toInt()! ) {
            
            self.totalLemonContain.text = "\(self.totalLemonContain.text!.toInt()! - self.lemonMixNumberLabel.text!.toInt()!)"
            
            self.totalIceContain.text = "\(self.totalIceContain.text!.toInt()! - self.iceMixNumberLabel.text!.toInt()!)"
            
            self.lemonUsedThisRound.text = "\(self.lemonUsedThisRound.text!.toInt()! + self.lemonMixNumberLabel.text!.toInt()!)"
            
            self.iceUsedThisRound.text = "\(self.iceUsedThisRound.text!.toInt()! + self.iceMixNumberLabel.text!.toInt()!)"
            
            if self.iceUsedThisRound.text!.toInt()! == 0 {
                var myRatio:String = NSString(format: "%.01f", Double(self.lemonUsedThisRound.text!.toInt()!)*100)
                self.iceLemonRatioThisRound.text = myRatio + "%"
            } else {
                var myRatio:String = NSString(format: "%.01f", Double(self.lemonUsedThisRound.text!.toInt()!)*100/Double(self.iceUsedThisRound.text!.toInt()!))
                self.iceLemonRatioThisRound.text = myRatio + "%"
            }
            
            self.lemonMixNumberLabel.text = "0"
            self.iceMixNumberLabel.text = "0"
            self.iceLemonRatio.text = "0.0%"
            self.mixIceSteper.value = 0.0
            self.mixLemonSteper.value = 0.0
            
            self.lemonUsedThisRound.text = "\(self.lemonUsedThisRound.text!.toInt()! + self.lemonMixNumberLabel.text!.toInt()!)"
        
        } else {
            showAlertWithTest(header: "Not enough material", message: "You need to purchase more material to mix it")
        }
    }
    
    
    @IBAction func startOfTheDayButtonPresse(sender: UIButton) {
        if self.lemonUsedThisRound.text!.toInt() != 0 || self.iceUsedThisRound.text!.toInt()! != 0 {
            
            todaysWeather = Factory.generatRandomWeather()
            weatherImage.image = todaysWeather.weatherImage
            self.waitingToRespondLabel.hidden = true
            self.numberOfVisitorLabel.hidden = false
            self.numberOfVisitorPurchasedLabel.hidden = false
            
            self.lemonUsedThisRound.text = "0"
            self.iceUsedThisRound.text = "0"
            self.iceLemonRatioThisRound.text = "0.0%"
            
            var rand = Int(arc4random_uniform(UInt32(10))) + 1
            var peopleArray:[Person] = []
            peopleArray = Factory.generatNumberOfRandomPeople(rand, weather: todaysWeather)

            var acidic:CGFloat = 0.0
        
            if self.iceUsedThisRound.text!.toInt()! == 0 {
                acidic = CGFloat(self.lemonUsedThisRound.text!.toInt()!)
            } else {
                acidic = CGFloat(self.lemonUsedThisRound.text!.toInt()!) / CGFloat(self.iceUsedThisRound.text!.toInt()!)
            }
        
            var numberOfPersonBought:Int = 0
            
            for person in peopleArray {
                if acidic < 1 && person.tastPreference <= 0.4 {
                    numberOfPersonBought += 1
                } else if acidic == 1 && person.tastPreference < 0.6 {
                    numberOfPersonBought += 1
                } else if acidic > 1 && person.tastPreference >= 0.6 {
                    numberOfPersonBought += 1
                }
            }
            
            totalNumberOfLemonSold += numberOfPersonBought
            
            self.numberOfVisitorLabel.text = "there are total of \(peopleArray.count) visited today"
            self.numberOfVisitorPurchasedLabel.text = "there are total of \(numberOfPersonBought) bought your Lemonade"
            
            self.totalMoneyMade.text = "\(self.totalMoneyMade.text!.toInt()! + numberOfPersonBought)"
            
            if self.totalMoneyMade.text!.toInt()! == 0 && self.totalIceContain.text!.toInt()! == 0 && self.totalLemonContain.text!.toInt()! == 0 {
                showAlertWithTest(header: "The Game End", message: "You sold a total of \(totalNumberOfLemonSold) of lemonade", tit : "Restart Game")
                resetGame()
            }
        } else {
            showAlertWithTest(message: "You must buy at least some lemon and Ice")
        }
    }
    

    func setUpStepperButton() {
        self.mixIceSteper.wraps = false
        self.mixIceSteper.autorepeat = false
        self.mixIceSteper.minimumValue = 0
        
        self.mixLemonSteper.wraps = false
        self.mixLemonSteper.autorepeat = false
        self.mixLemonSteper.minimumValue = 0
        
        self.purchaseIceStepper.wraps = false
        self.purchaseIceStepper.autorepeat = false
        self.purchaseIceStepper.minimumValue = 0
        
        self.purchaseLemonStepper.wraps = false
        self.purchaseLemonStepper.autorepeat = false
        self.purchaseLemonStepper.minimumValue = 0
    }
    
    
    func showAlertWithTest(header: String = "Warning", message: String, tit: String = "ok :(") {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: tit, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetGame() {
        self.totalMoneyMade.text = "10"
        self.totalIceContain.text = "1"
        self.totalLemonContain.text = "1"
        self.numberOfVisitorPurchasedLabel.hidden = true
        self.numberOfVisitorLabel.hidden = true
        self.waitingToRespondLabel.hidden = false
        self.iceLemonRatioThisRound.text = "0"
        self.lemonUsedThisRound.text = "0"
        self.iceLemonRatioThisRound.text = "0.0%"
        self.purchaseIceStepper.value = 0.0
        self.purchaseLemonStepper.value = 0.0
        self.mixIceSteper.value = 0.0
        self.mixLemonSteper.value = 0.0
    }
    
}

