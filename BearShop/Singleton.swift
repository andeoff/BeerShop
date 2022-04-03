//
//  Singleton.swift
//  BearShop
//
//  Created by Andrey on 3/31/22.
//

import Foundation
import UIKit

class Manager {
    
    static let shared = Manager()
    
    private let arrayBeers = [
        Beer(name: "Kozel", price: 10),
        Beer(name: "Hemled", price: 20),
        Beer(name: "Krok", price: 30)
        
    ]
    
    private init() {}
    
    func getBeer (name :String) -> Beer {
        return arrayBeers.filter({$0.name == name}).first!
    }
    
    func sellBeer () {
        var string = ""
        for beer in arrayBeers {
            beer.quantity -= beer.selected
            
            string.append("Beer : \(beer.name) , quantity : \(beer.quantity) , sum : \(beer.selected * beer.price) $ \n")
            beer.selected = 0
        }
        
        print(string)
    }
    
    func hideAllLabel (_ collectionLabel : [UILabel] , _ condition : Bool)  {
        if condition {
        for item in collectionLabel {
            item.isHidden = true
        }
        } else {
            for item in collectionLabel {
                item.isHidden = false
            }
        }
    }
    
    func hideAllButtons (_ collectionButton : [UIButton] , _ condition : Bool) {
        if condition {
        for item in collectionButton {
            item.isHidden = true
        }
       
        } else {
            for item in collectionButton {
                item.isHidden = false
            }
            
        }
    }
    
    func newDay (_ resultLabel : UILabel , _ countCollection : [UILabel]) {
        for label in countCollection {
            label.text = "0"
        }
        for beer in arrayBeers {
            beer.quantity = 100
        }
        resultLabel.text = ""
        
    }
    
    func endDay (_ resultLabel : UILabel , _ countCollection : [UILabel] ,_ vc : ViewController) {
        for label in countCollection {
            label.text = "0"
        }
        resultLabel.text = ""
        let alert = UIAlertController(title: "День закончился!", message: "Заказать новое пиво?", preferredStyle: .alert)
        let actionOne = UIAlertAction(title: "No", style: .cancel, handler: .none)
        let actionTwo = UIAlertAction(title: "Yes", style: .default, handler: {_ in
            let alert = UIAlertController(title: "Готово!", message: "Новые поставочки прибыли в магазин 😍", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: .none)
            alert.addAction(action)
            vc.present(alert, animated: true, completion: .none)
            
        })
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        vc.present(alert, animated: true, completion: .none )
    }
    
    
}
