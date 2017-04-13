//
//  GameController.swift
//  Card Koenig
//
//  Created by Balgard on 4/13/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit

class GameController: UIViewController
{
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    @IBAction func backPressed(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
}
