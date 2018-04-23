//
//  FirstViewController.swift
//  TabsPro
//
//  Created by Girijah Nagarajah on 3/2/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var loanAmountTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var yearsTextField: UITextField!
    var keyBoardHeight:CGFloat = 0.0
    @IBOutlet weak var paymentOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - keyboard handling code
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: .UIKeyboardWillShow, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        //this moves the tab bar above the keyboard for all devices
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {

            self.keyBoardHeight = keyboardSize.origin.y - keyboardSize.height - (self.tabBarController?.tabBar.frame.height)!
        }
        // tabBarMoved = true
        var tabBarFrame: CGRect = (self.tabBarController?.tabBar.frame)!
        tabBarFrame.origin.y = self.keyBoardHeight
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            self.tabBarController?.tabBar.frame = tabBarFrame })
    }
    
    @IBAction func calculateMortgage (_ sender:Any) {
        let amount = Float(loanAmountTextField.text!)
        let rate = Float(rateTextField.text!)
        let years = Float(yearsTextField.text!)
        
        let mortgage = Formulae.Mortgage(loanAmount: amount!, interestRate: rate!, numOfYears: years!)
        paymentOutput.text = String(Formulae.calculateMortgage(mortgageDetail: mortgage))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

