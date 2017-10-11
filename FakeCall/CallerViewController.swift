//
//  CallerViewController.swift
//  FakeCall
//
//  Created by Duygu on 2.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class CallerViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.hideKeyboardWhenTappedAround()
        
        mobileTextField.delegate = self
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
    @IBAction func saveButton(_ sender: Any) {
        if mobileTextField.text == "" || nameTextField.text == "" {
            let alertController = UIAlertController(title: "", message: "please fill in the blank", preferredStyle: .alert)
             let cancelAction = UIAlertAction(title: "Close", style: .cancel)
             alertController.addAction(cancelAction)
             present(alertController, animated: true, completion: nil)
            
        }else{
        UserDefaults.standard.set(mobileTextField.text, forKey: "mobileUserDefaults")
        UserDefaults.standard.set(nameTextField.text, forKey: "nameUserDefaults")
        Utilities.toastView(messsage: "name and kind saved", view: self.view)
        }
    }
    
    //MARK: TextField Delegation
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /*switch textField.tag {
        case 1:
            //1. den sonra nexte basıldı
            UserDefaults.standard.set(nameTextField.text, forKey: "nameUserDefaults")
        case 2:
            UserDefaults.standard.set(nameTextField.text, forKey: "mobileUserDefaults")
          // 2.den sonra nexte basıldı
        default:
            break
        }*/
        
        return Utilities.enableKeyboardforNext(textField: textField)
    }
    
}
