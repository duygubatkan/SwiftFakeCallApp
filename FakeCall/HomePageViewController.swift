//
//  HomePageViewController.swift
//  FakeCall
//
//  Created by Duygu on 1.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,GADBannerViewDelegate {

    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var tableView: UITableView!
    var imageList = [#imageLiteral(resourceName: "time"),#imageLiteral(resourceName: "photo"),#imageLiteral(resourceName: "ifbell")]
    var settingsList = ["Time","Caller","Ringtone & Vibration"]
    let date = Date()
    let calendar = Calendar.current
   @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomePageCell.nib, forCellReuseIdentifier: HomePageCell.identifier)
        //MARK: button color and radius
        startButtonOutlet.backgroundColor = UIColor.init(red: 0/255, green: 185/255, blue: 199/255, alpha: 1)
        startButtonOutlet.layer.cornerRadius = 10
       //banner
        bannerView.adSize = kGADAdSizeBanner
        bannerView.adUnitID = "ca-app-pub-3040308963093338/4439554760"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: TableView Delegation
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return imageList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageCell.identifier, for: indexPath) as! HomePageCell
        cell.settingsLabel.text = settingsList[indexPath.row]
        cell.settingsImageView.image = imageList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: TimeViewController.identifier) as! TimeViewController
            self.navigationController?.pushViewController(destinationVC, animated: true)
        case 1:
            let destinationVC1 = storyboard?.instantiateViewController(withIdentifier: "CallerViewController") as! CallerViewController
            self.navigationController?.pushViewController(destinationVC1, animated: true)
        case 2:
            let destinationVC2 = storyboard?.instantiateViewController(withIdentifier: "RingtoneViewController") as! RingtoneViewController
            self.navigationController?.pushViewController(destinationVC2, animated: true)
        default:
            break
        }
    
    }
    
    // MARK: Button Action/Empty control
    @IBAction func startCallButton(_ sender: Any) {
        if UserDefaults.standard.integer(forKey: "selectedTime") == 0{
            UserDefaults.standard.set(10, forKey: "selectedTime")
        }
        if UserDefaults.standard.string(forKey: "selectedSoundName") == nil{
            UserDefaults.standard.set("Default", forKey: "selectedSoundName")
        }
        if UserDefaults.standard.string(forKey: "nameUserDefaults") == nil {
           Utilities.createAlertController(viewController: self, title: "", message: "please fill in the name space", actionTitle: "Close")
        }
        if UserDefaults.standard.string(forKey: "mobileUserDefaults") == nil{
            Utilities.createAlertController(viewController: self, title: "", message: "please fill in the type space", actionTitle: "Close")
        }else{
            Utilities.passNewViewController(viewIdentifier: "waitView", viewC: self)
        }
    }
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}
