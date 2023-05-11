//
//  ViewController.swift
//  timerApp
//
//  Created by Cyrus Butcher on 3/10/23.
//

import UIKit

var currentPlayer = 0
var currentTimer = 0
var timeLeftOne = 10
var timeLeftTwo = 10

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var gameOver: UIView!
    @IBOutlet weak var timerTextOne: UILabel!
    @IBOutlet weak var timerTextTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timerTextOne.isHidden = true
        timerTextTwo.isHidden = true
    }

    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        print("tap")
        print(currentPlayer)
        if currentPlayer == 0 {
            image.image = UIImage(named: "timerThree")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
                currentPlayer = 1
                }
            currentTimer = 1
                }
        if currentPlayer == 1 {
            image.image = UIImage(named: "timerTwo")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
                currentPlayer = 2
                }
            currentTimer = 2
                }
        if currentPlayer == 2 {
            image.image = UIImage(named: "timerThree")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            currentPlayer = 1
                }
            currentTimer = 1
                }
        print(currentPlayer)
        timerPick()
                }
    
    
    func timerPick() {
        if currentTimer == 1{
            timerTextOne.isHidden = false
            timerTextTwo.isHidden = true
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                timeLeftOne -= 1
                self.timerTextOne.text = String(timeLeftOne)
                print(timeLeftOne)
                if(timeLeftOne==0){
                    timer.invalidate()
                    animation()
                }
                if currentTimer != 1 {
                    timer.invalidate()
                }
                }
                }
        
        if currentTimer == 2 {
            timerTextTwo.isHidden = false
            timerTextOne.isHidden = true
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                timeLeftTwo -= 1
                self.timerTextTwo.text = String(timeLeftTwo)
                print(timeLeftTwo)
                if(timeLeftTwo==0){
                    timer.invalidate()
                    animation()
                }
                if currentTimer != 2 {
                    timer.invalidate()
                }
                }
                }
                }
    
    func gameOverFunc() {
        gameOver.isHidden = false
        for i in 1...250 {
            print("Step 1")
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(i), repeats: false) { (timer) in
                UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
//                    this will change Y position of your imageView center
                    self.gameOver.center.y -= CGFloat(Int.random(in: -10...10))
                    self.gameOver.center.x -= CGFloat(Int.random(in: -10...10))
                    
                    
                    self.gameOver.center.y -= 1
                    self.gameOver.center.x += 1
                    
                    // self.paging
                    }, completion: nil)
                    }
            //23
                    }
        gameOver.isHidden = true
                    }
    func animation () {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: 425, y: -410)
        animation.toValue = CGPoint(x: 425, y: 600)
        animation.duration = 5.0
        animation.repeatCount = 1
        gameOver.layer.add(animation, forKey: nil)
    }
    
}

