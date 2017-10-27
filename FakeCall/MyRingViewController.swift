//
//  MyRingViewController.swift
//  FakeCall
//
//  Created by Duygu on 19/10/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class MyRingViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var player: AVAudioPlayer?
    var soundSwitch: Bool?
    var vibrationSwitch: Bool?
    var selectedSound: String?
    
    
    override func viewDidLoad() {
       super.viewDidLoad()

        nameLabel.text = UserDefaults.standard.string(forKey: "nameUserDefaults")
        // Do any additional setup after loading the view.
        soundSwitch = UserDefaults.standard.bool(forKey: "soundSwitchIsOn")
        vibrationSwitch = UserDefaults.standard.bool(forKey: "vibrationSwitchIsOn")
        selectedSound = UserDefaults.standard.string(forKey: "selectedSoundName")
        if soundSwitch == true {
            playSound()
        }
        if vibrationSwitch == true{
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
        
    }

  
    @IBAction func acceptBotton(_ sender: UIButton) {
        if player != nil {
            player?.stop()
            player = nil
        }
        Utilities.passNewViewController(viewIdentifier: "myCallerView", viewC: self)
    }
    
    @IBAction func rejectButton(_ sender: UIButton) {
        if player != nil {
            player?.stop()
            player = nil
        }
        
        Utilities.passNewViewController(viewIdentifier: "navigationControl", viewC: self)
    }
    func playSound() {
        if selectedSound == ""{
            selectedSound = "Default"
        }else{
            guard let url = Bundle.main.url(forResource: selectedSound, withExtension: "mp3") else { print("here")
                return }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                player.numberOfLoops = -1
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
