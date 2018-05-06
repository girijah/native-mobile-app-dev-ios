//
//  ViewController.swift
//  Days
//
//  Created by Girijah Nagarajah on 3/23/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePickerFirst: UIDatePicker!
    
    @IBOutlet weak var datePickerSecond: UIDatePicker!
    
    @IBOutlet weak var firstDateLabel: UILabel!
    
    @IBOutlet weak var secondDateLabel: UILabel!
    
    @IBOutlet weak var daysUntilLabel: UILabel!
    
    @IBOutlet weak var weeksAndDatesUntilLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func daysBetween(date1: Date, date2: Date) -> Int {
        let days: Double = date2.timeIntervalSince(date1) / (3600 * 24)
        let time = Int(days)
        return time
    }

    @IBAction func firstDatePicked(_ sender: UIDatePicker) {
        let days = daysBetween(date1: datePickerFirst.date, date2: datePickerSecond.date)
        self.firstDateLabel.text = "First Date  " + String(describing: sender.date)
            self.daysUntilLabel.text =  String(days)
    }
    
    @IBAction func secondDatePicked(_ sender: UIDatePicker) {
        let days = daysBetween(date1: datePickerFirst.date, date2: datePickerSecond.date)
        self.secondDateLabel.text = String(describing: sender.date)
        self.daysUntilLabel.text =  String(days)
    }
    
    func datesChanged() {
        let daysGap = daysBetween(date1: datePickerFirst.date, date2: datePickerSecond.date)
        self.daysUntilLabel.text =  "\(daysGap)"
    }
    
    

}

