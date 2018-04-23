//
//  ThirdViewController.swift
//  TabsPro
//
//  Created by Girijah Nagarajah on 3/2/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController  {
    
    @IBOutlet weak var labelDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        labelDisplay.text = sender.text
    }
    
}
