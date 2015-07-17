//
//  ExchangeRate.swift
//  CurrencyCalculator
//
//  Created by Jacob Aronoff on 7/17/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

import Foundation
class ExchangeRate {
    var home: Currency
    var foreign: Currency
    var lastFetched: NSDate?
    var rate: Double?
    
    
    init(homeCurrency aHome:Currency, foreignCurrency aForeign:Currency){
        home=aHome
        foreign=aForeign
    }
    func convertToForeignCurrency(amountOfCash money:Double)->Double{
        var moneyAsDouble = Double(money)
        var rateAsDouble = Double(self.rate!)
        var multiple = moneyAsDouble*rateAsDouble as NSNumber
        var string: String! = foreign.formatter?.stringFromNumber(multiple)
        var converted = string as NSString
        
        return converted.doubleValue;
    }
    func convertToHomeCurrency(amountOfCash money:Double)->Double{
        var moneyAsDouble = Double(money)
        var rateAsDouble = Double(self.rate!)
        var multiple = moneyAsDouble/rateAsDouble as NSNumber
        var string: String! = home.formatter?.stringFromNumber(multiple)
        var converted = string as NSString
        
        return converted.doubleValue;
    }
    func updateRate()->Bool{
        let prefix:NSString = "http://query.yahooapis.com/v1/public/yql?&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=&q="
        var yqlQuery: String? = ("select * from yahoo.finance.xchange where pair in (\"\(self.home.code+self.foreign.code)\")").stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        let query = "\(prefix)\(yqlQuery!)"
        //println("\(query)");
        
        var results:NSDictionary? = nil
        var jsonError:NSError? = nil
        
        let jsonData = NSData(contentsOfURL: NSURL(string: query)!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &jsonError)
        
        if jsonData != nil {
            //println((NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments, error: &jsonError) as! NSDictionary?)?.valueForKey("query")?.valueForKey("results")?.valueForKey("rate"));
            results = (NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments, error: &jsonError) as! NSDictionary?)?.valueForKey("query")?.valueForKey("results")?.valueForKey("rate") as? NSDictionary;
            rate=((results?.valueForKey("Rate")) as? NSString)?.doubleValue;
            //println(rate);
        }
        if jsonError != nil {
            NSLog( "ERROR while fetching/deserializing YQL data. Message \(jsonError!)" )
            return false
        }
        return true
    }
    
}