//
//  ViewController.swift
//  Concentration
//
//  Created by Alexey Ananin on 15.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet {
            touchersLabel.text = "Touchers: \(touches)"
        }
    }
    
    private var emojiCollection = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼",
                           "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "👾"]
    
    private var emojiDictionary = [Int : String]()
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            emojiDictionary[card.identifier] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.isEnabled = false
            } else {
                button.setTitle("", for: .normal)
//                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4877254367, blue: 1, alpha: 1)
                if card.isMatched {
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                    button.isEnabled = false
                } else {
                    button.backgroundColor = #colorLiteral(red: 0, green: 0.4860507846, blue: 0.9981886744, alpha: 1)
                    button.isEnabled = true
                }
            }
        }
    }

    @IBOutlet private weak var touchersLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.choseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
