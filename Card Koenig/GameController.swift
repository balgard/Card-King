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
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cpuCardsLeft: UILabel!
    @IBOutlet weak var playerCardsLeft: UILabel!
    var selectedCard = Card()
    var game = ""
    var pickerData = [String]()
    
    @IBAction func selectCardButton(_ sender: UIButton)
    {
        for x in containerView.subviews
        {
            if var gameView = x as? GoFishView
            {
                print("TEST")
            }
            else
            {
                
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
    
    /*  End of PickerView Stuff */
    
    func selectGame()
    {
        if game == "War"
        {
            containerView.removeConstraints(containerView.constraints)
            var temp = containerView.subviews
            for x in temp{
                x.removeFromSuperview()
            }
            var gameView = War(frame:(CGRect(x:0, y:67, width:375, height: 600)))
            containerView.addSubview(gameView)
            var cpuImage = War(frame:(CGRect(x:132, y:0, width: 111, height: 130)))
            gameView.addSubview(cpuImage)
            var cpuCard = War(frame:(CGRect(x:244, y:209, width: 111, height: 130)))
            gameView.addSubview(cpuCard)
            var playerImage = War(frame:(CGRect(x:132, y:420, width: 111, height: 130)))
            gameView.addSubview(playerImage)
            var playerCard = War(frame:(CGRect(x:21, y:209, width: 111, height: 130)))
            gameView.addSubview(playerCard)
            var selectCard = War(frame:(CGRect(x:125, y:383, width: 124, height: 30)))
            gameView.addSubview(selectCard)
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
