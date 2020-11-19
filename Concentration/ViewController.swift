//
//  ViewController.swift
//  Concentration
//
//  Created by Alexey Ananin on 15.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let emojiCollection = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼",
                           "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "👾"]
    
    var touches = 0 {
        didSet {
            touchersLabel.text = "Touchers: \(touches)"
        }
    }

    @IBOutlet weak var touchersLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let buttonIndex = buttonCollection.firstIndex(of: sender)
        touches += 1
        if let buttonIndex = buttonIndex {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.004997697193, green: 0.5134931207, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

