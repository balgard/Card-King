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
            }   else    {
                k += 1
            }
        }
    }
    
    func checkForUserTwoPairs()  {
        /*i = userTwoCards.count
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
        }*/
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
    
    func goFishDeal(/*player: Int, handSize: Int, */deckSize: Int)    {
        while(deckSize != 0)    {
            if(userOneCards.count < 7) {
                userOneCards.append()
                //Remove card from the deck
            }   else if(userTwoCards.count < 7)    {
                userTwoCards.append()
            }   else    {
                drawCards.append()
            }
        }
    }
}
