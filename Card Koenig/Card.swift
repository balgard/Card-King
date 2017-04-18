//
//  Card.swift
//  Card Koenig
//
//  Created by Balgard on 4/11/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

class Card
{
    var value : Int
    var suite: String
    var rank : String
    var color: String
    var image : String
    
    
    init(value: Int, suite: String, rank: String, color: String, image: String)
    {
        self.value = value
        self.suite = suite
        self.rank = rank
        self.color = color
        self.image = image
    }
    
    func assignRank(value: Int)
    {
        if value == 1
        {
            rank = "Ace"
        }
        else if value < 11 && value > 1
        {
            rank = String(value)
        }
        else if value == 11
        {
            rank = "Jack"
        }
        else if value == 12
        {
            rank = "Queen"
        }
        else
        {
            rank = "King"
        }
    }
}
