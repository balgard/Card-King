//
//  UnoCard.swift
//  Card Koenig
//
//  Created by Brent Behling on 4/12/17.
//  Copyright © 2017 Balgard. All rights reserved.
//

class UnoCard   {
    
    var color : String
    var image : String
    var type : String
    var value : Int
    
    init(color : String, image : String, type : String, value : Int) {
        self.color = color
        self.image = image
        self.type = type
        self.value = value
    }
}
