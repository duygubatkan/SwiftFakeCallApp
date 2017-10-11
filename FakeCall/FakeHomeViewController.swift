//
//  FakeHomeViewController.swift
//  FakeCall
//
//  Created by Duygu on 9.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class FakeHomeViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var homePageImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureSetup()
    }
    
    //MARK: Setups & Configurations
    func tapGestureSetup() {
        homePageImage.isUserInteractionEnabled = true
        
        // Single Tap
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTap))
        singleTap.delegate = self
        
        // Double Tap
        let doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        
        homePageImage.addGestureRecognizer(doubleTap)
        homePageImage.addGestureRecognizer(singleTap)
    }
    
    @objc func handleSingleTap() {
        Utilities.toastView(messsage: "click twice to return to the main screen", view: self.view)
        /*let alertController = UIAlertController(title: "", message: "click twice to return to the main screen", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Close", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)*/
        
        
    }
    @objc func handleDoubleTap() {
        let storyboard = UIStoryboard(name: "Main2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "navigationControl") as UIViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
    


