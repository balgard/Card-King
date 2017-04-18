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
    
    override func viewDidLoad()
    {
        
    }
    
    @IBAction func backToMenu(segue: UIStoryboardSegue)
    {
        
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueToGame", sender: sender)
    }
}

