//
//  ViewController.swift
//  ios-hw-4
//
//  Created by Mieln Be on 6/30/20.
//  Copyright © 2020 fouzm70. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    
    @IBOutlet weak var turnLabel: UILabel!
   
    var buttons: [UIButton] = []
    var counter = 0
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
    }
    @IBAction func press(_ sender: UIButton) {
        
        print("pressed")
        
        if counter % 2 == 0{
        sender.setTitle("X", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            turnLabel.text = "O turn"
    }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLabel.text = "X turn"
        }
          counter += 1
        sender.isEnabled = false
        Winning(winner: "X")
        Winning(winner: "O")
}
    @IBAction func resetTapped() {
        self.restartGame()
    }
    
    func Winning( winner: String)
    {
        //X winning
        if
        (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner ) ||
        (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner ) ||
        (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner ) ||
        (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner ) ||
        (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner ) ||
        (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner ) ||
        (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner ) ||
        (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner ) {
            
            print("\(winner) won")
            let alertController = UIAlertController(title: "\(winner) won", message: "click Restart to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .cancel) { (alert) in self.restartGame()}
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
    }
  
    func restartGame()
    {
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
            
        }
        counter = 0
        turnLabel.text = "X Turn"
        turnLabel.text = "O Turn"
    }

}
