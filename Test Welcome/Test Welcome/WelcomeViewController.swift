//
//  WelcomeViewController.swift
//  Test Welcome
//
//  Created by 张添 on 24/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit
import Foundation

class WelcomeViewController : UIViewController {
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // LoginButton.layer.cornerRadius = 0.5 * LoginButton.bounds.size.width
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func thumbsUpButtonPressed(sender: AnyObject) {
        // LoginButton.backgroundColor = UIColor.whiteColor()
    }
    
}