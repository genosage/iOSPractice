//
//  ViewController.swift
//  ChineseZodiac
//
//  Created by 张添 on 23/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yearOfBirth: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    let offset = 4
    
    @IBAction func OKTapped(sender: AnyObject) {
        yearOfBirth.resignFirstResponder()
        let year = yearOfBirth.text
        if year != "" {
           var imageNumber = (Int(year!)!-offset) % 12
            image.image = UIImage(named: String(imageNumber))
        }else{
        
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        yearOfBirth.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
