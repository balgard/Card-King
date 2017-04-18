//
//  GameController.swift
//  Card Koenig
//
//  Created by Balgard on 4/13/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit

class GameController: UIViewController
{
    var standardDeck = [Card]()
    var otherDeck = [AnyObject]()
    
    func deal(player: Int, handSize: Int, deckSize: Int)
    {
        
    }
    
    func shuffle(deck: [AnyObject])
    {
        
    }
    
    func fillDeck(deck: [AnyObject])
    {
        var i = 0
        var x = 0
        var temp = deck
        while i < 4
        {
            var letter = ""
            var suite = ""
            var color = ""
            if i == 0
            {
                letter = "c"
                suite = "Clubs"
                color = "Black"
            }
            else if i == 1
            {
                letter = "d"
                suite = "Diamonds"
                color = "Red"
            }
            else if i == 2
            {
                letter = "h"
                suite = "Hearts"
                color = "Red"
            }
            else
            {
                letter = "s"
                suite = "Spades"
                color = "Black"
            }
            while x < 13
            {
                var imageName = ""
                if x < 10
                {
                    imageName = "\(letter)0\(x)"
                }
                else
                {
                    imageName = "\(letter)\(x)"
                }
                var c = Card(value: x, suite: suite, rank: "", color: color, image: imageName)
                c.assignRank(value: c.value)
                temp.append(c)
            }
            x = 0
        }
        standardDeck = temp as! [Card]
    }
    
    
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func backPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
}
