//
//  Beer.swift
//  BearShop
//
//  Created by Andrey on 3/31/22.
//

import Foundation

class Beer {
    
    let name : String
    let price : Int
    var quantity : Int = 100
    var selected : Int = 0
    
    
    init( name : String , price : Int) {
        self.name = name
        self.price = price
    }
    
}
