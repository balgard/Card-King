//
//  War.swift
//  Card Koenig
//
//  Created by Tconti on 4/13/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

import UIKit

class War: UIView {
    var cards = 52
    var player1 = 26
    var player2 = 26
    func viewDidLoad()
    {
        
        //var player1Hand = UIImage(cgImage: #imageLiteral(resourceName: "Card-Back-1") as! CGImage)
        let player1Hand = "Card-Back-1"
        let image = UIImage(named: player1Hand)
        let imageView = UIImageView(image: image!)
    }
}
