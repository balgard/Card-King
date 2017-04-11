//
//  Card.swift
//  Card Koenig
//
//  Created by Balgard on 4/11/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit

class Card: UILabel
{
    var value : Int
    var suite: String
    var rank : String
    var color: String
    var image : String
    
    
    func Card(value: Int, suite: String, rank: String, color: string, image: string)
    {
        self.value = value
        self.suite = suite
        self.rank = rank
        self.color = color
        self.image = image
    }
}
