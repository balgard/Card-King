//
//  War.swift
//  Card Koenig
//
//  Created by Tconti on 4/13/17.
//  Copyright © 2017 Balgard. All rights reserved.
//
/*Objectives: Game begins after segue. Cards are dealt to both CPU and Player. Player can that they have 26 cards but cannot view the value (Face down). Objective is to secure all the cards. When win condition is met. Present some sort of visual aide saying they have either won or lost.
 
 Turn by turn: Cpu places card first. Player can then counter with the card they've drawn. The higher value takes the two cards and adds them to the bottom of their respective pile.
 
 During instance of WAR (Equal values): Two cards must now be placed by each player. The first card placed is presented face down and the next card is face up. The higher of the second value wins the WAR and the subsequent cards used by both parties in the WAR. In the instance of a second draw, the WAR rages on with the same rules until there is no tie.
 
 For the sake of a player not having any cards to play during the instance of a WAR, this player will lose the WAR and the game itself.
 */

import UIKit

class War: UIView {
    var userOneCards = [Card]()
    var userTwoCards = [Card]()
    var drawCards = [Card]()
    var playerTurn = true
    var index = 0
    var count = 0
    var gameStatus = true
    
    
    func playCard(deck: [Card]){
        //playerCard = standardDeck.imageName
        
    }
    func warDeal(deck: [Card]){
        var temp = [Card]()
        temp = deck
        while (userOneCards.count < 26){
            userOneCards.append(temp[0])
            temp.remove(at: 0)
            userTwoCards.append(temp[0])
            temp.remove(at: 0)
            print("\(userOneCards.count)")
        }
        drawCards = temp
    }
    
    func draw(drawer: [Card]){
        var temp = drawer
        if drawCards.count > 0{
            temp.append(drawCards[0])
            drawCards.remove(at: 0)
        }
        if drawer == userOneCards{
            userOneCards = temp
            print("User 1")
        }
        else
        {
            userTwoCards = temp
            print("User 2")
        }
    }
    func gameBegin(deck: [Card]){
        userOneCards.removeAll()
        userTwoCards.removeAll()
        warDeal(deck: deck)
    }
    }
