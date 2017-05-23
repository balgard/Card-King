//
//  GameController.swift
//  Card Koenig
//
//  Created by Balgard on 4/13/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit


class GameController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    var standardDeck = [(Card)]()
    var otherDeck = [AnyObject]()
    
    
    @IBOutlet weak var cardsLeft: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var otherScore: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cpuCardsLeft: UILabel!
    @IBOutlet weak var playerCardsLeft: UILabel!
    var selectedCard = Card()
    var game = ""
    var pickerData = [String]()
    var playerOneHand = [String]()
    var tempSelect = ""
    
    @IBAction func selectCardButton(_ sender: UIButton)
    {
        pickerView.isUserInteractionEnabled = false
        var count = 0
        for x in containerView.subviews
        {
            count = 0
            if var gameView = x as? GoFishView
            {
                count = 0
                var checker = gameView.userOneCards
                for m in gameView.userOneCards
                {
                    if m.getDescription() == tempSelect //finds card selected in player hand
                    {
                        for n in gameView.userTwoCards //finds card in cpu hand
                        {
                            if n.getDescription() == tempSelect
                            {
                                count += 1
                            }
                            
                        }
                        if count > 0 //checks if go fish is needed
                        {
                            gameView.checkDifferentHand(checked: gameView.userTwoCards, asker: gameView.userOneCards, card: m)
                            count = 0
                        }
                        else
                        {
                            gameView.draw(drawer: gameView.userOneCards)
                            print("Drawn")
                        }
                        gameView.checkForCompleted(hand: gameView.userOneCards)
                        gameView.dealMidGame(hand: gameView.userOneCards)
                        var temp = [String]()
                        for card in gameView.userOneCards
                        {
                            temp.append(card.getDescription())
                        }
                        pickerData = temp
                        pickerView.reloadAllComponents()
                        cardsLeft.text = "Cards Left: \(gameView.drawCards.count)"
                        playerScore.text = "\(gameView.userOnePairs.count) Pairs"
                        //end of user turn
                    }
                }
                //start of cpu turn
                count = 0
                var y = gameView.userOneCards
                var cardSelected = gameView.userTwoCards[Int(arc4random_uniform(UInt32(gameView.userTwoCards.count - 1)))] //randomly selects a card in cpu hand
                for temp in gameView.userOneCards
                {
                    if temp == cardSelected
                    {
                        count += 1
                    }
                }
                if count > 0
                {
                    gameView.checkDifferentHand(checked: gameView.userOneCards, asker: gameView.userTwoCards, card: cardSelected)
                    count = 0
                    print("Checking For Change")
                }
                else
                {
                    gameView.draw(drawer: gameView.userTwoCards)
                    print("CPU DRAW")
                }
                gameView.checkForCompleted(hand: gameView.userTwoCards)
                gameView.dealMidGame(hand: gameView.userTwoCards)
                cardsLeft.text = "Cards Left: \(gameView.drawCards.count)"
                otherScore.text = "\(gameView.userTwoPairs.count) Pairs"
                
                if y != gameView.userOneCards
                {
                    var temp = [String]()
                    for card in gameView.userOneCards
                    {
                        temp.append(card.getDescription())
                    }
                    pickerData = temp
                    pickerView.reloadAllComponents()
                }
            }
            else
            {
                
            }
        }
        pickerView.isUserInteractionEnabled = true
    }
    func buttonAction(sender: UIButton!){
        
        print("Button Tapped")
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
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        selectGame()
    }
    
    /*  Start of PickerView Stuff   */
    
    //Returns the number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Returns the number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        tempSelect = pickerData[row]
        //have var = pickerData[row]
    }
    
    
    /*  End of PickerView Stuff */
    
    func selectGame()
    {
        if game == "War"
        {
            var temp = containerView.constraints
            containerView.removeConstraints(containerView.constraints)
            for x in containerView.subviews{
                x.removeFromSuperview()
            }
            var gameView = War(frame:(CGRect(x:0, y:67, width:375, height: 600)))
            var cpuImage = UIImageView(image: UIImage(named: "Card-Back-1"))
            cpuImage.frame = CGRect(x:132, y: 0, width: 111, height: 130)
            gameView.addSubview(cpuImage)
            var cpuCard = UIImageView(image: UIImage(named: "Card-Back-1"))
            cpuCard.frame = CGRect(x:244, y:209, width: 111, height: 130)
            gameView.addSubview(cpuCard)
            var playerImage = UIImageView(image: UIImage(named: "Card-Back-1"))
            playerImage.frame = CGRect(x:132, y:420, width: 111, height: 130)
            gameView.addSubview(playerImage)
            var playerCard = UIImageView(image: UIImage(named: "Card-Back-1"))
            playerCard.frame = CGRect(x:21, y:209, width: 111, height: 130)
            gameView.addSubview(playerCard)
            var selectCard = UIButton(type: .system)
            selectCard.frame = CGRect(x:125, y:383, width: 124, height: 30)
            selectCard.setTitle("Flip Card", for: .normal)
            selectCard.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            gameView.addSubview(selectCard)
            containerView.addSubview(gameView)
            fillDeck(deck: standardDeck)
            shuffle(deck: standardDeck)
            
            for card in gameView.userOneCards{
                var temp = card.getDescription()
                playerOneHand.append(temp)
                
            }
            gameView.gameBegin(deck: standardDeck)
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
            fillDeck(deck: standardDeck)
            shuffle(deck: standardDeck)
            gameView.gameStart(deck:standardDeck)
            playerScore.text = "\(gameView.userOnePairs.count) Pairs"
            otherScore.text = "\(gameView.userTwoPairs.count) Pairs"
            cardsLeft.text = "\(gameView.drawCards.count) Cards Left"
            
            for card in gameView.userOneCards
            {
                var temp = card.getDescription()
                pickerData.append(temp)
            }
            var temp = containerView.constraints
            for x in containerView.subviews
            {
                gameView.addSubview(x)
                //x.removeFromSuperview()
            }
            containerView.addSubview(gameView)
            //gameView.removeConstraints(gameView.constraints)
            //gameView.addConstraints(temp)
            
        }
    }
    
    
    
    
    @IBAction func backPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
}
