//
//  LoginViewController.swift
//  Test Welcome
//
//  Created by 张添 on 24/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController : UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var EmailAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailAddress.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        EmailAddress.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
}