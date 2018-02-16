//
//  ViewController.swift
//  SegueTester
//
//  Created by Girijah Nagarajah on 2/16/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector( viewTapped))
        self.view.addGestureRecognizer(tap)
    }
    
    func viewTapped() {
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showButtonTapped(_ sender: UIButton) {
        //nameTextfield.text
//        self.navigationController!.pushViewController(self, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.name = nameTextfield.text!
            resultVC.occupation = occupationTextField.text!
            
            if let age = Int(ageTextField.text!) {
                resultVC.age = age
            }
            else {
                print("Invalid Age..")
            }
            
        }
    }

}

