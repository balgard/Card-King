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
}
