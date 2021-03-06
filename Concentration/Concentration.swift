//
//  Concentration.swift
//  Concentration
//
//  Created by Samad Khan on 2/5/19.
//  Copyright © 2019 Kesign. All rights reserved.
//

import Foundation

class Concentration {
    var d_cardList : Array<Card> = Array<Card>()
    var d_flipCount : Int = 0
    var d_score : Int = 0
    var d_lastCardIndex : Int? = nil
    var d_seenIds : Set<Int> = Set<Int>()
    
    init(numberOfCardPairs: Int){
        for _ in 0..<numberOfCardPairs {
            let card : Card = Card();
            // The constructed card will have a unique id. We add the card twice
            // since there is always a pair of cards with the same id.
            d_cardList.append(card);
            d_cardList.append(card);
        }
        d_cardList.shuffle()
    }
    
    func chooseCard(idx : Int) {
        if d_cardList[idx].isMatched {
            return;
        }
        if d_cardList[idx].isFaceUp {
            return;
        }
        d_flipCount+=1;
        if let jdx = d_lastCardIndex {
            d_cardList[idx].isFaceUp = true;
            checkForMatch(idx:idx, jdx:jdx);
            d_lastCardIndex = nil;
        }
        else {
            for flipdownIndex in d_cardList.indices {
                d_cardList[flipdownIndex].isFaceUp = false
            }
            d_lastCardIndex = idx;
            d_cardList[idx].isFaceUp = true;
        }
    }
    
    func checkForMatch(idx: Int, jdx: Int)
    {
        if d_cardList[idx].id == d_cardList[jdx].id
        {
            d_cardList[idx].isMatched = true;
            d_cardList[jdx].isMatched = true;
            d_score += 2
        }
        else {
            if d_seenIds.contains(d_cardList[idx].id) {
                d_score -= 1
            }
            if d_seenIds.contains(d_cardList[jdx].id) {
                d_score -= 1
            }
        }
        d_seenIds.insert(d_cardList[idx].id)
        d_seenIds.insert(d_cardList[jdx].id)

    }
    
    func reset()
    {
        d_flipCount = 0
        d_score = 0
        d_seenIds.removeAll()
        for i in 0..<d_cardList.count {
            d_cardList[i].isFaceUp = false
            d_cardList[i].isMatched = false
        }
        d_cardList.shuffle()
    }
    
    
}
