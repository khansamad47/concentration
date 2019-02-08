//
//  Card.swift
//  Concentration
//
//  Created by Samad Khan on 2/5/19.
//  Copyright © 2019 Kesign. All rights reserved.
//

import Foundation

struct Card {
    var id : Int;
    var isFaceUp : Bool = false;
    var isMatched : Bool = false;
    
    // Constructor
    init()
    {
        id = Card.getNextId();
    }
    
    // Static method which returns the next id in sequence
    static func getNextId() -> Int {
        currentId+=1;
        return currentId;
    }
    static var currentId : Int = 0;
    
}
