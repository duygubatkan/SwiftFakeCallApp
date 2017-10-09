//
//  RingtoneViewController.swift
//  FakeCall
//
//  Created by Duygu on 2.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class RingtoneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        return cell
    }
    

    @IBAction func soundSwitch(_ sender: UISwitch) {
        if sender.isOn{
            UserDefaults.standard.set(true, forKey: "soundSwitchIsOn")
        // create a sound ID, in this case its the tweet sound.
        let systemSoundID: SystemSoundID = 1305
        // to play sound
        AudioServicesPlaySystemSound (systemSoundID)
        }
        
    }
    
    @IBAction func vibrationSwitch(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "vibrationSwitchIsOn")
        }
    }
    
}

