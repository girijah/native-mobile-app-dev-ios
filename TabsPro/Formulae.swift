//
//  Formulae.swift
//  TabsPro
//
//  Created by Girijah Nagarajah on 3/9/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import Foundation

class Formulae {
    /*
     To use this structure from another class i.e. in your button action - var mortgageDetails = Formulae.Mortage()
     */
    public struct Mortgage {
        
        var loanAmount:Float = 0.0
        var interestRate:Float = 0.0
        var numOfYears:Float = 0.0
        
        init(loanAmount:Float, interestRate:Float, numOfYears:Float){
            self.loanAmount = loanAmount
            self.interestRate = interestRate
            self.numOfYears = numOfYears
        }
    }
    
    public struct Saving {
        var interestRate:Float = 0.0
        var montlyPayment:Float = 0.0
        var numOfYears:Float = 0.0
        
    }
    
    class func calculateMortgage(mortgageDetail:Mortgage)->Float {
        //formula here
        return 0.0 //dummy value
    }
    
    class func calculateSavings(savingsDetail:Saving)->Float {
        //formula here
        return 0.0 //dummy value }
    }

}
