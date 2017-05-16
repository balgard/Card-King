//
//  Card.swift
//  Card Koenig
//
//  Created by Balgard on 4/11/17.
//  Copyright © 2017 Balgard. All rights reserved.
//
import UIKit


class Card: UIImageView
{
    var value = 0
    var suite = ""
    var rank = ""
    var color = ""
    var imageName = ""
    var faceDown = false
    
    

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
    
    func setImage(name: String)
    {
        if faceDown == false
        {
        self.image = UIImage(named: name)
        }
        else
        {
            self.image = UIImage(named: "Card-Back-1")
        }
    }
    func getDescription() -> String
    {
        return "\(self.rank) of \(self.suite)"
    }
}
