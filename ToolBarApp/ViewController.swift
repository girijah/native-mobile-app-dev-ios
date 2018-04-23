//
//  ViewController.swift
//  ToolBarApp
//
//  Created by Girijah Nagarajah on 3/6/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let toolbarTool1 = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onClickedTool1Button(sender:)))
         let toolbarTool1 = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(onClickedTool1Button(sender:)))
        toolBar.setItems([toolbarTool1], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onClickedTool1Button(sender: UIBarButtonItem) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
        self.present(nextViewController, animated:true, completion:nil)
    }


}

