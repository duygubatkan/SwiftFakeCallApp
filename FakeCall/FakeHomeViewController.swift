//
//  FakeHomeViewController.swift
//  FakeCall
//
//  Created by Duygu on 9.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import GoogleMobileAds

class FakeHomeViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var homePageImage: UIImageView!
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureSetup()
        //MARK: interstitial ad
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3040308963093338/1707372228")
        let request = GADRequest()
        interstitial.load(request)
        if interstitial.isReady {interstitial.present(fromRootViewController: self)
        }
        
    
    }
    
    //MARK: Setups & Configurations
    func tapGestureSetup() {
        homePageImage.isUserInteractionEnabled = true
        
        // Single Tap
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTap))
        singleTap.delegate = self
        
        // Double Tap
        let doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        
        homePageImage.addGestureRecognizer(doubleTap)
        homePageImage.addGestureRecognizer(singleTap)
    }
    
    @objc func handleSingleTap() {
        Utilities.toastView(messsage: "click twice to return to the main screen", view: self.view)
    }
    @objc func handleDoubleTap() {
       Utilities.passNewViewController(viewIdentifier: "navigationControl", viewC: self)
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        }
    }
}
    


