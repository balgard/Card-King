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
    var userTurn = true
    var index = 0
    var i = 0
    var k = 0
    var x = 0
    
    func viewDidLoad()  {
        
    }
    
    func checkForUserOnePairs()  {
        i = userOneCards.count
        k = 0
        x = 0
        while(k < i)    {
            x = k + 1
            while(x < i)    {
                if(userOneCards[k].value == userOneCards[x].value)  {
                    userOnePairs.append(userOneCards[k])
                    userOneCards.remove(at: x)
                    userOneCards.remove(at: k)
                }
            }
            k += 1
        }
    }
    
    func checkForUserTwoPairs()  {
        i = userTwoCards.count
        k = 0
        x = 0
        while(k < i)    {
            x = k + 1
            while(x < i)    {
                if(userTwoCards[k].value == userTwoCards[x].value)  {
                    userTwoPairs.append(userTwoCards[k])
                    userTwoCards.remove(at: x)
                    userTwoCards.remove(at: k)
                    break
                }
            }
            k += 1
        }
    }
    
    func userOneCheckDeck(selectedCard: Card)    {
        for card in userTwoCards    {
            if(selectedCard.value == card.value)    {
                print("Is in cpu")
                userOneCards.append(card)
                userTwoCards.remove(at: userTwoCards.index(of: card)!)
                checkForUserOnePairs()
                break
            }
        }
    }
    
    func userTwoCheckDeck(selectedCard: Card)    {
        for card in userOneCards    {
            if(selectedCard.value == card.value)    {
                print("Is in user")
                userTwoCards.append(card)
                userOneCards.remove(at: userOneCards.index(of: card)!)
                checkForUserTwoPairs()
                break
            }
        }
    }
}
