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
//    var player = [Card]()
//    var cpu = [Card]()
//    var drawCards = [Card]()
//    var playerTurn = true
//    var index = 0
//    var count = 0
//    var gameStatus = true
//
//
//func viewDidLoad()
//{
//    print("TEST")
//}
//    func gameBegin(){
//        
//    }
//
//func gameReady(deck: [Card]){
//    var currentHand = [Card]()
//    currentHand = deck
//    while(currentHand.count != 0){
//    if player.count < 26 {
//        player.append(currentHand[0])
//        currentHand.remove(at: 0)
//        cpu.append(currentHand[0])
//        currentHand.remove(at:0)
//        gameStatus = false
//    }
//    else { gameStatus = true
//        gameBegin()
//    }
//    }
//    playerTurn = true
//}
//func displayWinLossMessage(message: String){
//    let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
//    let alertAction = UIAlertAction(title: "Reset", style: .default) {
//        (action) -> Void in self.resetGame()
//    }
//    alert.addAction(alertAction)
//    present(alert, animated: true, completion: nil)
//    gameStatus = false
//}
//
//func checkForWinner(){
//    if player.count == 0 || cpu.count == 0{
//        displayWinLossMessage(message: "Player 1 Win")
//        resetGame()
//    }
//    
//    func resetGame(){
//        
//    }
//    
//    func deal(players: Int, handSize: Int)
//    {
//      
//    }
//    
//    func test()
//    {
//        print("TEST")
//    }
//}
}
