//
//  ResultViewController.swift
//  SegueTester
//
//  Created by Girijah Nagarajah on 2/16/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var occupationLabel: UILabel!
    
    var name:String!
    
    var occupation:String!
    
    var age:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.layer.cornerRadius = 5
        ageLabel.layer.cornerRadius = 5
        occupationLabel.layer.cornerRadius = 5
        
        nameLabel.text = name
        occupationLabel.text = occupation

            if age == nil {
                ageLabel.text = ""
                print("Age nil")
            } else {
                ageLabel.text = String(age)
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController? .popViewController(animated: true)
    }

}
