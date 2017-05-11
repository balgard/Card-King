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
    var standardDeck = [(Card)]()
    var otherDeck = [AnyObject]()
    
    @IBOutlet weak var containerView: UIView!
    var game = ""
    func deal(player: Int, handSize: Int, deckSize: Int)
    {
        
    }
    
    func shuffle(deck: [AnyObject])
    {
        var tempDeck = [Card]()
        while standardDeck.count > 0
        {
            var random = Int(arc4random_uniform(UInt32(standardDeck.count)))
            var card = standardDeck.remove(at: random)
            tempDeck.append(card)
        }
        standardDeck = tempDeck
    }
    
    func fillDeck(deck: [AnyObject])
    {
        var i = 0
        var x = 1
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
            while x < 14
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
                var c = Card()
                c.value = x
                c.suite = suite
                c.color = color
                c.imageName = imageName
                c.assignRank(value: c.value)
                c.setImage(name: c.imageName)
                temp.append(c)
                x += 1
            }
            x = 1
            i += 1
        }
        standardDeck = temp as! [Card]
    }
    
    
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fillDeck(deck: standardDeck)
        shuffle(deck: standardDeck)
        selectGame()
    }
    
    func selectGame()
    {
        if game == "War"
        {
            var gameView = War(frame:(CGRect(x:0, y:67, width:375, height: 600)))
            containerView.addSubview(gameView)
        }
        else if game == "Solitaire"
        {
            var gameView = SolitaireView(frame: CGRect(x: 0, y:67, width: 375, height: 600))
            containerView.addSubview(gameView)
            gameView.shuffle(playerNumber: 0, handSize: 0)
        }
        else if game == "Go Fish"
        {
            var gameView = GoFishView(frame:CGRect(x:0, y:67, width:375,height:600))
            containerView.addSubview(gameView)
        }
    }
    
    
    @IBAction func backPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
}
