//
//  RingViewController.swift
//  FakeCall
//
//  Created by Duygu on 4.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class RingViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    var player: AVAudioPlayer?
    var soundSwitch: Bool?
    var vibrationSwitch: Bool?
    var selectedSound: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = UserDefaults.standard.string(forKey: "nameUserDefaults")
        mobileLabel.text = UserDefaults.standard.string(forKey: "mobileUserDefaults")
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
    @IBAction func declineButton(_ sender: Any) {
        if player != nil {
            player?.stop()
            player = nil
        }
        //open new screen
        let storyboard = UIStoryboard(name: "Main2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "fakeHomeView") as UIViewController
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func acceptButton(_ sender: Any) {
        if player != nil {
            player?.stop()
            player = nil
        }
        //open new screen
        let storyboard = UIStoryboard(name: "Main2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "speakView") as UIViewController
        self.present(vc, animated: true, completion: nil)
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
    

