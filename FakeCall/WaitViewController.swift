//
//  WaitViewController.swift
//  FakeCall
//
//  Created by Duygu on 6.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {
    var timer = Timer()
    var selectedSecond:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSecond = UserDefaults.standard.integer(forKey: "selectedTime")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    @objc func updateCountDown() {
        if selectedSecond > 0{
            selectedSecond = selectedSecond - 1
        }else{
            timer.invalidate()
            //open new screen
            let storyboard = UIStoryboard(name: "Main2", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ringView") as UIViewController
            self.present(vc, animated: true, completion: nil)
        
        }
    
    }
    
}
