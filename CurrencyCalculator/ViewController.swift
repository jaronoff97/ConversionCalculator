//
//  ViewController.swift
//  CurrencyCalculator
//
//  Created by Jacob Aronoff on 7/17/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var homeSymbol: UILabel!
    @IBOutlet weak var foreignSymbol: UILabel!

    @IBOutlet weak var convertButtonOutlet: UIButton!
    @IBOutlet weak var homePickerView: UIPickerView!
    @IBOutlet weak var foreignPickerView: UIPickerView!
    @IBOutlet weak var homeTextField: UITextField!
    @IBOutlet weak var foreignTextField: UITextField!
    let pickerData = [Currency().sharedEuro(),Currency().sharedUSDollar(),Currency().sharedBritishPound(),Currency().sharedIsraeliShekel(),Currency().sharedTurkishLira(),Currency().sharedCanadaDollar(),Currency().sharedJapaneseYen(),Currency().sharedSwissFranc()]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        homePickerView.dataSource = self
        homePickerView.delegate = self
        foreignPickerView.dataSource = self
        foreignPickerView.delegate = self
        
        homeTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func convertButton(sender: AnyObject) {
        var homeCurrency: Currency! = pickerData[homePickerView.selectedRowInComponent(0)];
        var foreignCurrency: Currency! = pickerData[foreignPickerView.selectedRowInComponent(0)];
        var doubleFromHomeField = (homeTextField.text as NSString).doubleValue;
        var xr: ExchangeRate = ExchangeRate(homeCurrency: homeCurrency, foreignCurrency: foreignCurrency)
        var updated: Bool = xr.updateRate()
        if updated==true{
            foreignTextField.text=String(format:"%f", xr.convertToForeignCurrency(amountOfCash: doubleFromHomeField))
            homeSymbol.text=homeCurrency.symbol
            foreignSymbol.text=foreignCurrency.symbol
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        println("Something happened")
        convertButton(convertButtonOutlet)
        return pickerData[row].description
    }
    func textFieldDidChange(textField: UITextField) {
        convertButton(convertButtonOutlet)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = pickerData[row]
    }
}

