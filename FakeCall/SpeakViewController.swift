//
//  SpeakViewController.swift
//  FakeCall
//
//  Created by Duygu on 3.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SpeakViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var minute = 00
    var seconds = 00
    var timer = Timer()
    var minutesSring : String!
    var secondsString : String!
    var timeString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = UserDefaults.standard.string(forKey: "nameUserDefaults")
        timeLabel.text =  "0" + String(minute) + ":" + "0" + String(seconds)
        startTimer(timer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startTimer(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }

    @objc func UpdateTimer() {
        seconds = seconds + 1
        if seconds % 60 == 0  {
            minute = minute + 1
        }
        minute = minute % 60
        seconds = seconds % 60
        minutesSring = String(minute)
        secondsString = String(seconds)
        if minute < 10 {
            minutesSring = "0\(String(minute))"
        }
        if seconds < 10 {
            secondsString = "0\(String(seconds))"
        }
        timeString = minutesSring + ":"  + secondsString
        timeLabel.text = timeString
    }
    
    @IBAction func endCallButton(_ sender: Any) {
        timer.invalidate()
        Utilities.passNewViewController(viewIdentifier: "fakeHomeView", viewC: self)
    }
}
