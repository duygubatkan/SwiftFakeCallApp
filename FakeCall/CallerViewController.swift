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
        mobileTextField.delegate = self
        nameTextField.delegate = self
        mobileTextField.text =  UserDefaults.standard.string(forKey: "mobileUserDefaults")
        nameTextField.text = UserDefaults.standard.string(forKey: "nameUserDefaults")
        navigationItem.title = "Caller"
        self.hideKeyboardWhenTappedAround()
        //MARK: Right Button Navigation
        let rightButtonItem = UIBarButtonItem.init(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(rightButtonTapped)
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func rightButtonTapped() {
        if mobileTextField.text == "" || nameTextField.text == "" {
            Utilities.createAlertController(viewController: self, title: "", message: "please fill in the blank", actionTitle: "Close")
        }else{
            UserDefaults.standard.set(mobileTextField.text, forKey: "mobileUserDefaults")
            UserDefaults.standard.set(nameTextField.text, forKey: "nameUserDefaults")
            Utilities.toastView(messsage: "Name and type saved", view: self.view)
        }
    }
}




    //MARK: TextField
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField.tag {
//        case 1:
//            //1. den sonra nexte basıldı
//            UserDefaults.standard.set(nameTextField.text, forKey: "nameUserDefaults")
//        case 2:
//            UserDefaults.standard.set(mobileTextField.text, forKey: "mobileUserDefaults")
//          // 2.den sonra nexte basıldı
//        default:
//            break
//        }
//      return Utilities.enableKeyboardforNext(textField: textField)
//    }

