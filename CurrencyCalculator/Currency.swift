//
//  Currency.swift
//  CurrencyCalculator
//
//  Created by Jacob Aronoff on 7/17/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

import Foundation
class Currency: Printable {
    var symbol: String?
    var name: String!
    var code: String!
    var formatter: NSNumberFormatter?
    var myUSCurrency: Currency?
    var myTurkishCurrency: Currency?
    var myBritishCurrency: Currency?
    var myIsraeliCurrency: Currency?
    var myEuroCurrency: Currency?
    var mySwissFranc: Currency?
    var myCanadaDollar: Currency?
    var myJapaneseYen: Currency?
    
    init(){
        name=""
        code=""
    }
    init(symbol aSymbol: String, name aName: String, code aCode: String){
        symbol=aSymbol
        name=aName
        code=aCode
    }
    var description: String{
        return name!
    }
    func sharedUSDollar()->Currency{
        if myUSCurrency==nil{
            myUSCurrency = Currency(symbol: "$", name: "US Dollars", code: "USD")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myUSCurrency!.formatter=myFormatter

            println("MADE A NEW CURRENCY")
        }
        return myUSCurrency!;
    }
    func sharedTurkishLira()->Currency{
        if myTurkishCurrency==nil{
            myTurkishCurrency = Currency(symbol: "₺", name: "Turkish Lira", code: "TRY")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myTurkishCurrency!.formatter=myFormatter

        }
        return myTurkishCurrency!;
    }
    func sharedBritishPound()->Currency{
        if myBritishCurrency==nil{
            myBritishCurrency = Currency(symbol: "₤", name: "Great British Pound", code: "GBP")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myBritishCurrency!.formatter=myFormatter
        }
        return myBritishCurrency!;
    }
    func sharedIsraeliShekel()->Currency{
        if myIsraeliCurrency==nil{
            myIsraeliCurrency = Currency(symbol: "₪", name: "Israeli Shekel", code: "ILS")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myIsraeliCurrency!.formatter=myFormatter

        }
        return myIsraeliCurrency!;
    }
    func sharedEuro()->Currency{
        if myEuroCurrency==nil{
            myEuroCurrency = Currency(symbol: "€", name: "Euro", code: "EUR")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myEuroCurrency!.formatter=myFormatter

        }
        return myEuroCurrency!;
    }
    func sharedSwissFranc()->Currency{
        if mySwissFranc==nil{
            mySwissFranc = Currency(symbol: "Fr", name: "Swiss Franc", code: "CHF")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            mySwissFranc!.formatter=myFormatter
        }
        return mySwissFranc!;
    }
    func sharedCanadaDollar()->Currency{
        if myCanadaDollar==nil{
            myCanadaDollar = Currency(symbol: "$", name: "Canadian Dollar", code: "CAD")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myCanadaDollar!.formatter=myFormatter

        }
        return myCanadaDollar!;
    }
    func sharedJapaneseYen()->Currency{
        if myJapaneseYen==nil{
            myJapaneseYen = Currency(symbol: "¥", name: "Japanese Yen", code: "JPY")
            var myFormatter: NSNumberFormatter? = NSNumberFormatter();
            myFormatter!.maximumFractionDigits=2;
            myFormatter!.minimumFractionDigits=2;
            myJapaneseYen!.formatter=myFormatter
        }
        return myJapaneseYen!;
    }
    
}