//
//  ViewController.swift
//  BearShop
//
//  Created by Andrey on 3/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kozelLabel: UILabel!
    
    @IBOutlet weak var hemledLabel : UILabel!
    
    @IBOutlet weak var krokLabel : UILabel!
    
    
    @IBOutlet weak var amountKozel: UILabel!
    
    @IBOutlet weak var amountHemled: UILabel!
    
    @IBOutlet weak var amountKrok: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet var countCollection: [UILabel]!
    
    
    @IBOutlet var collectionHideLabel: [UILabel]!
    
    @IBOutlet var collectionHideButton: [UIButton]!

    let kozel = Manager.shared.getBeer(name: "Kozel")
    let hemled = Manager.shared.getBeer(name: "Hemled")
    let krok = Manager.shared.getBeer(name: "Krok")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for label in countCollection {
            label.text = "0"
        }
        
        Manager.shared.hideAllLabel(collectionHideLabel, true)
        Manager.shared.hideAllButtons(collectionHideButton, true)
        
        kozelLabel.text = "\(kozel.name)"
        hemledLabel.text = "\(hemled.name)"
        krokLabel.text = "\(krok.name)"
        resultLabel.text = ""
      
       
    }
    

    @IBAction func startButtonTapped(_ sender: UIButton) {
        Manager.shared.hideAllLabel(collectionHideLabel, false)
        Manager.shared.hideAllButtons(collectionHideButton, false)
        sender.isHidden = true
        
    }
 
    @IBAction func beerAddKozel(_ sender: UIButton) {
        
        if kozel.quantity == kozel.selected {return}
        
        kozel.selected += 1
        
        amountKozel.text = "\(kozel.selected)"
        
             
    }
    
    
    @IBAction func beerAddHemled(_ sender: UIButton) {
        
        
        if hemled.quantity == hemled.selected {return}
        
        hemled.selected += 1
        
        amountHemled.text = "\(hemled.selected)"
        
        
    }
    
    
    @IBAction func beerAddKrok(_ sender: UIButton) {
        
        
        
        if krok.quantity == krok.selected {return}
        
        krok.selected += 1
        
        amountKrok.text = "\(krok.selected)"
    }
    
    
    
    @IBAction func beerMinusKozel(_ sender: UIButton) {
        
        if Int(amountKozel.text!) == 0 {return}
        
        let beer = Manager.shared.getBeer(name: "Kozel")
        
        if beer.quantity == 0 {return}
        
        beer.selected -= 1
        amountKozel.text = "\(beer.selected)"
        

    }
    
    @IBAction func beerMinusHemled (_ sender : UIButton) {
        
        if Int(amountHemled.text!) == 0 {return}
        
        let hemled = Manager.shared.getBeer(name: "Hemled")
        
        if hemled.quantity == 0 {return}
        
        hemled.selected -= 1
        
        amountHemled.text = "\(hemled.selected)"
        
        
    }
    @IBAction func beerMinusKrok (_ sender : UIButton) {
        if Int(amountKrok.text!) == 0 {return}
        
        let krok = Manager.shared.getBeer(name: "Krok")
        
        if krok.quantity == 0 {return}
        
        krok.selected -= 1
        
        amountKrok.text = "\(krok.selected)"
        
        
    }
    
    
    
    @IBAction func soldBeer(_ sender: UIButton) {
        for label in countCollection {
            label.text = "0"
        }
        resultLabel.text = """
                           \(kozel.name) : \(kozel.selected) * \(kozel.price) $ = \(kozel.selected * kozel.price) $
                           \(hemled.name) : \(hemled.selected) * \(hemled.price) $ = \(hemled.selected * hemled.price) $
                           \(krok.name) : \(krok.selected) * \(krok.price) $ = \(krok.selected * krok.price) $
                           """
        Manager.shared.sellBeer()
        
        
        
        
    }
    
    @IBAction func newGameTapped(_ sender: UIButton) {
        Manager.shared.newDay(resultLabel, countCollection)
    }
    
    @IBAction func dayEnded(_ sender: UIButton) {
        Manager.shared.endDay(resultLabel, countCollection, self)
    }
      
    
}



