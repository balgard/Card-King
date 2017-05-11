//
//  ViewController.swift
//  Card Koenig
//
//  Created by Balgard on 4/11/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var solitaireButton : UIButton!
    @IBOutlet weak var card: Card!
    @IBOutlet weak var warButton: UIButton!
    @IBOutlet weak var goFishButton: UIButton!
    
    var buttons = [UIButton]()
    
    override func viewDidLoad()
    {
        card.setImage(name: "s01")
        buttons.append(solitaireButton)
        buttons.append(warButton)
        buttons.append(goFishButton)
    }
    
    @IBAction func backToMenu(segue: UIStoryboardSegue)
    {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let dvc = segue.destination as! GameController
        for x in buttons
        {
            if x == sender as! UIButton
            {
                if x == warButton
                {
                    dvc.game = "War"
                }
                else if x == solitaireButton
                {
                    dvc.game = "Solitaire"
                }
                else if x == goFishButton
                {
                    dvc.game = "Go Fish"
                }
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueToGame", sender: sender)
    }
}

