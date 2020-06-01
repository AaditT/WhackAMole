//
//  ViewController.swift
//  WhackMole
//
//  Created by Aadit Trivedi on 5/29/20.
//  Copyright © 2020 Aadit Trivedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftPress: UIButton!
    @IBOutlet weak var middlePress: UIButton!
    @IBOutlet weak var rightPress: UIButton!
    @IBOutlet weak var messageBoard: UILabel!
    
    var score = 0
    var leftHoleMole = false
    var middleHoleMole = false
    var rightHoleMole = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetScore()
        resetImages()
        resetHoleMoles()
        messageBoard.text = ""
    }
    
    func updateScore(score: Int) {
        scoreValue.text = "\(score)"
    }
    
    func incrementScore() {
        score += 1
        scoreValue.text = "\(score)"
    }
    
    func resetScore() {
        score = 0
        scoreValue.text = "\(score)"
    }
    
    func resetImages() {
        leftImage.image = #imageLiteral(resourceName: "hole")
        middleImage.image = #imageLiteral(resourceName: "hole")
        rightImage.image = #imageLiteral(resourceName: "hole")
    }
    
    func resetHoleMoles() {
        leftHoleMole = false
        middleHoleMole = false
        rightHoleMole = false
    }
    
    func hit() {
        print("Hit")
        messageBoard.textColor = UIColor.green
        messageBoard.text = "You Hit!"
    }
    
    func miss() {
        messageBoard.textColor = UIColor.red
        messageBoard.text = "You Missed!"
    }
    
    func messageBoardReset() {
        messageBoard.text = ""
    }
    
    @IBAction func whackPressed(_ sender: UIButton) {
        resetImages()
        resetHoleMoles()
        let moleHoleNum = Int.random(in: 0...2)
        
        if (moleHoleNum == 0) {
            leftImage.image = #imageLiteral(resourceName: "mole")
            leftHoleMole = true
        } else if (moleHoleNum == 1) {
            middleImage.image = #imageLiteral(resourceName: "mole")
            middleHoleMole = true
        } else if (moleHoleNum == 2) {
            rightImage.image = #imageLiteral(resourceName: "mole")
            rightHoleMole = true
        }
        
        switch sender {
        case leftPress:
            if (leftHoleMole == true) {
                hit()
                incrementScore()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.messageBoardReset()
                    self.resetHoleMoles()
                    self.resetImages()
                }
            } else {
                miss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.messageBoardReset()
                    self.resetHoleMoles()
                    self.resetImages()
                }
            }
        case middlePress:
            if (middleHoleMole == true) {
                hit()
                incrementScore()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.messageBoardReset()
                    self.resetHoleMoles()
                    self.resetImages()
                }
            } else {
                miss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.messageBoardReset()
                    self.resetHoleMoles()
                    self.resetImages()
                }
            }
        case rightPress:
            if (rightHoleMole == true) {
                hit()
                incrementScore()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.messageBoardReset()
                    self.resetHoleMoles()
                    self.resetImages()
                }
            } else {
                miss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.messageBoardReset()
                    self.resetHoleMoles()
                    self.resetImages()
                }
            }
        default:
            break
        }
        
    }
    

}

