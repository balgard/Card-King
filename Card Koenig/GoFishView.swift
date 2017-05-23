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
    var selectedCard = Card()
    
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
        organizeCardDeck()
        var temp = hand
        var i = 0
        var k = 0
        var userOne = false
        var pairFound = false
        while(i < temp.count)
        {
            pairFound = false
            k = i + 1
            while(k < temp.count)
            {
                if temp[i].value == temp[k].value
                {
                    pairFound = true
                    break
                }
                else
                {
                    k += 1
                }
            }
            if pairFound == true
            {
                if hand == userOneCards
                {
                    userOnePairs.append(temp[i])
                    userOne = true
                }
                else
                {
                    userTwoPairs.append(temp[i])
                }
                temp.remove(at: k)
                temp.remove(at: i)
            }
            else
            {
                i += 1
            }
        }
        if userOne == true
        {
            userOneCards = temp
        }
        else
        {
            userTwoCards = temp
        }
    }
    
    
    
    func dealMidGame(hand: [Card])   {
        var temp = hand
        if temp.count <= 1
        {
            print("Dealing")
            while(temp.count < 7)   {
                if(drawCards.count != 0)    {
                    print(temp.count)
                    temp.append(drawCards[0])
                    drawCards.remove(at: 0)
                }
            }
        }
        if hand == userOneCards
        {
            userOneCards = temp
        }
        else
        {
            userTwoCards = temp
        }
    }
    func draw(drawer:[Card])
    {
        var temp = drawer
        if drawCards.count >= 0
        {
            temp.append(drawCards[0])
            drawCards.remove(at: 0)
            print(temp.last?.getDescription())
        }
        if drawer == userOneCards
        {
            userOneCards = temp
        }
        else
        {
            userTwoCards = temp
        }
    }
    
    func checkDifferentHand(checked: [Card], asker: [Card], card: Card)
    {
        var temp = asker
        var m = checked
        for x in checked
        {
            if x.value == card.value
            {
                temp.append(x)
                m.remove(at: m.index(of: x)!)
            }
        }
        if asker == userOneCards
        {
            userOneCards = temp
            userTwoCards = m
        }
        else
        {
            userTwoCards = temp
            userOneCards = m
        }
        organizeCardDeck()
        checkForCompleted(hand: asker)
        organizeCardDeck()
    }
    
    func goFishDeal(deck: [Card])
    {
        var temp = [Card]()
        temp = deck
        while (userOneCards.count < 7)
        {
            userOneCards.append(temp[0])
            temp.remove(at: 0)
            userTwoCards.append(temp[0])
            temp.remove(at:0)
        }
        drawCards = temp
    }
    
    
    func isGameOver(deckOne : [Card], deckTwo: [Card], draw: [Card]) -> Bool
    {
        if deckOne.count == 0 && deckTwo.count == 0 && draw.count == 0
        {
            return true
        }
        else
        {
            return false
        }
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
        organizeCardDeck()
        checkForCompleted(hand: userOneCards)
        checkForCompleted(hand: userTwoCards)
        organizeCardDeck()
    }
}
