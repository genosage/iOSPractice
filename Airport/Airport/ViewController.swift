//
//  ViewController.swift
//  Airport
//
//  Created by 张添 on 17/10/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ESTBeaconManagerDelegate {
   
    @IBOutlet weak var label: UILabel!

    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "8492E75F-4FD6-469D-B132-043FE94921D8")!,
        identifier: "ranged region")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
        label.text = "none"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let aBeacon = beacons.first
        if aBeacon != nil{
            if aBeacon!.rssi > -50{
                if label.text != "near"{
                label.text = "near"}}
            else if aBeacon!.rssi < -50{
                if label.text != "far"
                {label.text = "far"}}
        }else{
            if label.text != "none"{label.text = "none"}}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

