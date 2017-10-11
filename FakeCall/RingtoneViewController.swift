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
    
    @IBOutlet weak var soundOutletSwitch: UISwitch!
    @IBOutlet weak var vibrationSwitchOutlet: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    var playList = ["default","silk","strum","xylophone"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        if UserDefaults.standard.bool(forKey: "soundSwitchIsOn") == true{
            soundOutletSwitch.setOn(true, animated: true)
        }else{
            soundOutletSwitch.setOn(false, animated: true)
        }
        if UserDefaults.standard.bool(forKey: "vibrationSwitchIsOn") == true{
            vibrationSwitchOutlet.setOn(true, animated: true)
        }else{
            vibrationSwitchOutlet.setOn(false, animated: true)
        }
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = playList[indexPath.row]
        cell.selectionStyle = .default
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            UserDefaults.standard.set(playList[0], forKey: "selectedSoundName")
        case 1:
            UserDefaults.standard.set(playList[1], forKey: "selectedSoundName")
        case 2:
            UserDefaults.standard.set(playList[2], forKey: "selectedSoundName")
        case 3:
            UserDefaults.standard.set(playList[3], forKey: "selectedSoundName")
        default:
            break
    }
}
    

    @IBAction func soundSwitch(_ sender: UISwitch) {
        if sender.isOn{
            UserDefaults.standard.set(true, forKey: "soundSwitchIsOn")
        }else{
            UserDefaults.standard.set(false, forKey: "soundSwitchIsOn")
        }
        
    }
    
    @IBAction func vibrationSwitch(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "vibrationSwitchIsOn")
        }else{
            UserDefaults.standard.set(false, forKey: "vibrationSwitchIsOn")
        }
    }
}
/*
// create a sound ID, in this case its the tweet sound.
let systemSoundID: SystemSoundID = 1305
// to play sound
AudioServicesPlaySystemSound (systemSoundID)
 */

