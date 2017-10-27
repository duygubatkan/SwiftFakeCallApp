//
//  WaitViewController.swift
//  FakeCall
//
//  Created by Duygu on 6.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {
    var selectedTime: String!
    var timer = Timer()
    var selectedSecond: Int!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSecond = UserDefaults.standard.integer(forKey: "selectedTime")
        switch selectedSecond {
        case 10:
            selectedTime = "10 seconds"
        case 30:
            selectedTime = "30 seconds"
        case 60:
            selectedTime = "1 minute"
        case 300:
            selectedTime = "5 minute"
        case 3600:
            selectedTime = "1 hour"
        default:
            break
        }
        let labelString = "The phone will be turned on in \(selectedTime!), please don't lock the screen and don't press the home button "
        infoLabel.text = labelString
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
    }

    
    @objc func updateCountDown() {
        if selectedSecond > 0{
            selectedSecond = selectedSecond - 1
        }else{
            timer.invalidate()
            Utilities.passNewViewController(viewIdentifier: "myRingView", viewC: self)
        }
    }
}
