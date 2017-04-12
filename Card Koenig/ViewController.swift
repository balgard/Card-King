//
//  ViewController.swift
//  Card Koenig
//
//  Created by Balgard on 4/11/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var card  = Card(value: 10, suite: "Diamonds", rank: "King", color: "Red", image: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

