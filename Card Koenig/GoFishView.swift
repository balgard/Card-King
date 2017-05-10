//
//  GoFishView.swift
//  Card Koenig
//
//  Created by Brent Behling on 5/8/17.
//  Copyright © 2017 Balgard. All rights reserved.
//
/*
 Ideas
 
 Use a scroll list to view all the cards that you have with small images of each card on the side
 When the games starts go through each players' deck and match the pairs that a given at the start
 if there are no more cards left count the players' pairs whoever has the most wins
*/
import UIKit

class GoFishView: UIView {
    
    var userCards = [Card]()
    var cpuCards = [Card]()
    var index = 0
    
    func viewDidLoad()  {
        
    }
    
    func userCheckDeck(selectedCard: Card)    {
        for card in cpuCards    {
            if(selectedCard.value == card.value)    {
                print("Is there")
                userCards.append(card)
                cpuCards.remove(at: cpuCards.index(of: card)!)
            }
        }
    }
    
    func cpuCheckDeck(selectedCard: Card)    {
        for card in userCards    {
            if(selectedCard.value == card.value)    {
                print("Is there")
                cpuCards.append(card)
                userCards.remove(at: userCards.index(of: card)!)
            }
        }
    }
}
