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
    @IBOutlet weak var button: UIButton!
    var war = War()
    @IBOutlet weak var card: Card!
    
    override func viewDidLoad()
    {
        card.setImage(name: "s01")
    }
    
    @IBAction func backToMenu(segue: UIStoryboardSegue)
    {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let dvc = segue.destination as! GameController
        dvc.warMode = war
    }
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueToGame", sender: sender)
        print("[Succ]ess")
    }
}

