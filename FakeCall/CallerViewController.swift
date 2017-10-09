//
//  CallerViewController.swift
//  FakeCall
//
//  Created by Duygu on 2.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class CallerViewController: UIViewController {

    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButton(_ sender: Any) {
    if mobileTextField.text == "" || nameTextField.text == "" {
           
        }
    UserDefaults.standard.set(mobileTextField.text, forKey: "mobileUserDefaults")
    UserDefaults.standard.set(nameTextField.text, forKey: "nameUserDefaults")
        
        
        
    }
    
}
