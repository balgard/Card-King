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
    
    var userOneCards = [Card]()
    var userOnePairs = [Card]()
    var userTwoCards = [Card]()
    var userTwoPairs = [Card]()
    var drawCards = [Card]()
    var userTurn = true
    var index = 0
    var gamePlaying = true
    
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
    func checkForCompleted(hand: [Card])  {
        i = hand.count
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
                if(count == 0 && hand[k].value == hand[x].value)  {
                    c2Pos = x
                    count += 1
                }   else if(count == 1 && hand[k].value == hand[x].value)   {
                    c3Pos = x
                    count += 1
                }   else if(count == 2 && hand[k].value == hand[x].value)   {
                    c4Pos = x
                    count += 1
                }
                x += 1
            }
            if(count == 3)  {
                hand.append(userOneCards[k])
                hand.remove(at: c4Pos)
                hand.remove(at: c3Pos)
                hand.remove(at: c2Pos)
                hand.remove(at: c1Pos)
                i = hand.count
                organizeCardPair()
            }   else    {
                k += 1
            }
        }
    }
    
    
    
    func dealMidGame(hand: [Card])   {
        if(hand.count == 0) {
            while(hand.count < 7)   {
                if(drawCards.count != 0)    {
                    hand.append(drawCards[0])
                    drawCards.remove(at: 0)
                }
            }
        }
    }
    func draw(drawer:[Card])
    {
        if drawCards.count > 0
        {
            drawer.append(drawCards[0])
            drawCards.remove(at: 0)
        }
    }
    
    func checkDifferentHand(checked: [Card], asker: [Card], card: Card)
    {
        for x in checked
        {
            if x.value == card.value
            {
                asker.append(x)
                checked.remove(at: checked.index(of: x)!)
            }
        }
    }
    
    func goFishDeal(deck: [Card])
    {
        var temp = [Card]()
        temp = deck
        while(temp.count != 0)
        {
            if(userOneCards.count < 7)
            {
                userOneCards.append(temp[0])
                temp.remove(at: 0)
                userTwoCards.append(temp[0])
                temp.remove(at:0)
            }
        }
        drawCards = temp
    }
    
    
    func playGame()
    {
        
    }
    
    
    func organizeCardDeck() {
        userOneCards = userOneCards.sorted { $0.value < $1.value }
        userTwoCards = userTwoCards.sorted { $0.value < $1.value }
    }

    func gameStart(deck: [Card])
    {
        userOneCards.removeAll()
        userOnePairs.removeAll()
        userTwoCards.removeAll()
        userTwoPairs.removeAll()
        goFishDeal(deck: deck)
        userTurn = true
    }
}
