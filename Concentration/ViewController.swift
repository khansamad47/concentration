//
//  ViewController.swift
//  Concentration
//
//  Created by Samad Khan on 2/5/19.
//  Copyright © 2019 Kesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game : Concentration = Concentration(numberOfCardPairs: cardButtons.count/2);
    var emojiList = ["👁","🐸","🦋","🌼","🌍","🌈","🍎","🎾","🚗"];
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        let idxOptional = cardButtons.index(of:sender);
        game.chooseCard(idx: idxOptional!);
        updateViewFromModel();
    }
    
    @IBAction func resetClicked() {
        game.reset()
        updateViewFromModel()
    }
    
    func updateViewFromModel()
    {
        for i in 0..<cardButtons.count {
            // This is a copy of the card
            // since its a struct. Structs
            // are always passed by value
            let card = game.d_cardList[i]
            let button = cardButtons[i]
            if (card.isFaceUp) {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.setTitle(emojiList[card.id], for: UIControl.State.normal)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 0.6488622427, blue: 0, alpha: 1)
            }
        }
        
        flipCountLabel.text = "Count: " + String(game.d_flipCount)
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
}

