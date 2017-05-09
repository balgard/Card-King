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
    @IBOutlet weak var presidentButton : UIButton!
    @IBOutlet weak var card: Card!
    @IBOutlet weak var warButton: UIButton!
    var buttons = [UIButton]()
    
    override func viewDidLoad()
    {
        card.setImage(name: "s01")
        buttons.append(presidentButton)
        buttons.append(warButton)
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
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueToGame", sender: sender)
    }
}

