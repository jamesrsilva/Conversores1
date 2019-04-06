//
//  ViewController.swift
//  Conversores
//
//  Created by Jameson Silva on 03/04/2019.
//  Copyright © 2019 Jameson Silva. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUni1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUni1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUni1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            btUni1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilômetro", for: .normal)
        default:
            lbUnit.text = "Peso"
            btUni1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUni1 {
                btUnit2.alpha = 0.5
            } else {
                btUni1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
    }
    
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUni1.alpha == 1{
            lbResultUnit.text = "Farenheit"
            lbResult.text = String(temperature * 1.8 + 32.0)
        }
        else{
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature * 1.8) / 32.0)
        }
    }
    
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUni1.alpha == 1{
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        }
        else{
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUni1.alpha == 1{
            lbResultUnit.text = "Dolar"
            lbResult.text = String(currency / 3.78)
        }
        else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.78)
        }
    }
    
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btUni1.alpha == 1{
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance / 1000.0)
        }
        else{
            lbResultUnit.text = "Kilômetros"
            lbResult.text = String(distance * 1000.0)
        }
    }
}


    


