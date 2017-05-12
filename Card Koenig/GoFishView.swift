//
//  GoFishView.swift
//  Card Koenig
//
//  Created by Brent Behling on 5/8/17.
//  Copyright © 2017 Balgard. All rights reserved.
//
/*
 Ideas
 
 Use a scroll view to view all the cards that you have with small images of each card on the side
 When the games starts go through each players' deck and match the pairs that a given at the start
 if there are no more cards left count the players' pairs whoever has the most wins
*/
import UIKit

class GoFishView: UIView {
    
    var standardDeck = [Card]()
    var userOneCards = [Card]()
    var userOnePairs = [Card]()
    var userTwoCards = [Card]()
    var userTwoPairs = [Card]()
    var drawCards = [Card]()
    var userTurn = true
    var index = 0
    
    //For checkForUserPairs
    var i = 0
    var k = 0
    var x = 0
    var c1Pos = 0
    var c2Pos = 0
    var c3Pos = 0
    var c4Pos = 0
    var count = 0
    
    func viewDidLoad()  {
        
    }
    
    //Change to check for pairs of four
    func checkForUserOnePairs()  {
        i = userOneCards.count
        k = 0
        x = 0
        count = 0
        c1Pos = 0
        c2Pos = 0
        c3Pos = 0
        c4Pos = 0
        while(k < i)    {
            x = k + 1
            c1Pos = k
            while(x < i)    {
                if(count == 0 && userOneCards[k].value == userOneCards[x].value)  {
                    c2Pos = x
                    count += 1
                }   else if(count == 1 && userOneCards[k].value == userOneCards[x].value)   {
                    c3Pos = x
                    count += 1
                }   else if(count == 2 && userOneCards[k].value == userOneCards[x].value)   {
                    c4Pos = x
                    count += 1
                }
                x += 1
            }
            if(count == 3)  {
                userOnePairs.append(userOneCards[k])
                userOneCards.remove(at: c4Pos)
                userOneCards.remove(at: c3Pos)
                userOneCards.remove(at: c2Pos)
                userOneCards.remove(at: c1Pos)
                i = userOneCards.count
                organizeCardPair()
            }   else    {
                k += 1
            }
        }
    }
    
    func checkForUserTwoPairs()  {
        i = userTwoCards.count
        k = 0
        x = 0
        count = 0
        c1Pos = 0
        c2Pos = 0
        c3Pos = 0
        c4Pos = 0
        while(k < i)    {
            x = k + 1
            c1Pos = k
            while(x < i)    {
                if(count == 0 && userTwoCards[k].value == userTwoCards[x].value)  {
                    c2Pos = x
                    count += 1
                }   else if(count == 1 && userTwoCards[k].value == userTwoCards[x].value)   {
                    c3Pos = x
                    count += 1
                }   else if(count == 2 && userTwoCards[k].value == userTwoCards[x].value)   {
                    c4Pos = x
                    count += 1
                }
                x += 1
            }
            if(count == 3)  {
                userTwoPairs.append(userTwoCards[k])
                userTwoCards.remove(at: c4Pos)
                userTwoCards.remove(at: c3Pos)
                userTwoCards.remove(at: c2Pos)
                userTwoCards.remove(at: c1Pos)
                i = userTwoCards.count
                organizeCardPair()
            }   else    {
                k += 1
            }
        }
    }
    
    func userOnePickUpCards(selectedCards: [Card])  {
        if(drawCards.count != 0)  {
            userOneCards.append(drawCards[0])
            drawCards.remove(at: 0)
        }
    }
    
    func userTwoPickUpCards(selectedCards: [Card])  {
        if(drawCards.count != 0)  {
            userTwoCards.append(drawCards[0])
            drawCards.remove(at: 0)
        }
    }
    
    func userOneDealMidGame()   {
        if(userOneCards.count == 0) {
            while(userOneCards.count < 7)   {
                if(drawCards.count != 0)    {
                    userOneCards.append(drawCards[0])
                    drawCards.remove(at: 0)
                }
            }
        }
    }
    
    func userTwoDealMidGame()   {
        if(userTwoCards.count == 0) {
            while(userTwoCards.count < 7)   {
                if(drawCards.count != 0)    {
                    userTwoCards.append(drawCards[0])
                    drawCards.remove(at: 0)
                }
            }
        }
    }
    
    func userOneCheckDeck(selectedCard: Card)    {
        for card in userTwoCards    {
            if(selectedCard.value == card.value)    {
                print("Is in user two")
                userOneCards.append(card)
                userTwoCards.remove(at: userTwoCards.index(of: card)!)
                checkForUserOnePairs()
            }
        }
    }
    
    func userTwoCheckDeck(selectedCard: Card)    {
        for card in userOneCards    {
            if(selectedCard.value == card.value)    {
                print("Is in user one")
                userTwoCards.append(card)
                userOneCards.remove(at: userOneCards.index(of: card)!)
                checkForUserTwoPairs()
            }
        }
    }
    
    func goFishDeal(deckSize: Int)    {
        while(deckSize != 0)    {
            if(userOneCards.count < 7) {
                userOneCards.append(standardDeck[0])
                standardDeck.remove(at: 0)
            }   else if(userTwoCards.count < 7)    {
                userTwoCards.append(standardDeck[0])
                standardDeck.remove(at: 0)
            }   else    {
                drawCards.append(standardDeck[0])
                standardDeck.remove(at: 0)
            }
        }
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
    
    func organizeCardDeck() {
        userOneCards = userOneCards.sorted { $0.value < $1.value }
        userTwoCards = userTwoCards.sorted { $0.value < $1.value }
        drawCards = drawCards.sorted { $0.value < $1.value }
    }
    
    func organizeCardPair() {
        userOnePairs = userOnePairs.sorted { $0.value < $1.value }
        userTwoPairs = userTwoPairs.sorted { $0.value < $1.value }
    }

    func gameStart()    {
        standardDeck.removeAll()
        userOneCards.removeAll()
        userOnePairs.removeAll()
        userTwoCards.removeAll()
        userTwoPairs.removeAll()
        drawCards = [Card]()
        userTurn = true
        
        fillDeck(deck: standardDeck)
        shuffle(deck: standardDeck)
        goFishDeal(deckSize: standardDeck.count)
        organizeCardDeck()
        checkForUserOnePairs()
        checkForUserTwoPairs()
    }
}
