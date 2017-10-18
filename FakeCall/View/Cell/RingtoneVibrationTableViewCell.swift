//
//  RingtoneVibrationTableViewCell.swift
//  FakeCall
//
//  Created by Duygu on 14/10/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class RingtoneVibrationTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    var isRingtone: Bool = false
   
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if isRingtone == true {
            //ringtone switch
            if switchOutlet.isOn{
                UserDefaults.standard.set(true, forKey: "soundSwitchIsOn")
                
            }else{
                UserDefaults.standard.set(false, forKey: "soundSwitchIsOn")
            }
        } else {
            //vibration switch
            if switchOutlet.isOn{
                UserDefaults.standard.set(true, forKey: "vibrationSwitchIsOn")
            }else{
                UserDefaults.standard.set(false, forKey: "vibrationSwitchIsOn")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//            if isRingtone == true {
//                print ("ringtone true")
//                if UserDefaults.standard.bool(forKey: "soundSwitchIsOn") == true{
//                    print ("userdefaults true")
//                    switchOutlet.setOn(true, animated: true)
//                }
//            }else {
//                print ("ringtone false")
//                if UserDefaults.standard.bool(forKey: "vibrationSwitchIsOn") == true{
//                    print ("userdefaults false")
//                    switchOutlet.setOn(true, animated: true)
//                }
//                }
        }
   }

