//
//  HomePageViewController.swift
//  FakeCall
//
//  Created by Duygu on 1.10.2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var imageList = [#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img2")]
    var settingsList = ["Time","Caller","Ringtone & Vibration"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomePageCell.nib, forCellReuseIdentifier: HomePageCell.identifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // MARK: TableView Delegation
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return settingsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageCell.identifier, for: indexPath) as! HomePageCell
        cell.settingsLabel.text = settingsList[indexPath.row]
        cell.settingsImageView.image = imageList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: HomePageCell.identifier) as! 
    }
    
    // MARK: Buttons Actions

    @IBAction func startCallButton(_ sender: Any) {
    
    }
    

}
