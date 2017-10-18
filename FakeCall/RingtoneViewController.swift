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
    var playList = ["Default", "Silk", "Strum", "Xylophone"]
    var settings = ["Ringtone", "Vibration"]
    var settingsBool = [false, false]
    var ringtoneUserDefault: Int?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Ringtone & Vibration"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tableView.register(RingtoneVibrationTableViewCell.nib, forCellReuseIdentifier: RingtoneVibrationTableViewCell.identifier)
        ringtoneUserDefault = UserDefaults.standard.integer(forKey: "selectedRowSound")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Select Ringtone"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: RingtoneVibrationTableViewCell.identifier, for: indexPath) as! RingtoneVibrationTableViewCell
            cell.labelName.text = settings[indexPath.row]
            if indexPath.row == 0 {
                cell.isRingtone = true
                 cell.switchOutlet.setOn(UserDefaults.standard.bool(forKey: "soundSwitchIsOn"), animated: true)
            } else {
                cell.isRingtone = false
                cell.switchOutlet.setOn(UserDefaults.standard.bool(forKey: "vibrationSwitchIsOn"), animated: true)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = playList[indexPath.row]
            cell.selectionStyle = .none
            if indexPath.row == ringtoneUserDefault {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
            return cell
        }
    }
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        Utilities.clearCheckmark(indexPath: indexPath, tableView: tableView)
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Utilities.clearCheckmark(indexPath: indexPath, tableView: tableView)
        if indexPath.section == 1
        {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
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
        UserDefaults.standard.set(indexPath.row, forKey: "selectedRowSound")
    }
}

