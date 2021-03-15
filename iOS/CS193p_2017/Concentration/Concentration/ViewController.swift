//
//  ViewController.swift
//  Concentration
//
//  Created by JINJOO on 2021/03/15.
//

import UIKit

class ViewController: UIViewController {
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices: Array<String> = ["🎃", "👻", "🎃", "👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
    //        flipCard(withEmoji: "👻", on: sender)
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("선택된 카드는 UIButton 배열에 없음;")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("filpCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

