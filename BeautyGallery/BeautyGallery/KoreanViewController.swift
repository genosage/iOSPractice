//
//  KoreanViewController.swift
//  BeautyGallery
//
//  Created by 张添 on 1/10/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import Foundation
import UIKit
import Social

class KoreanViewController: UIViewController {
    
    @IBOutlet weak var koreanBeautyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookTapped(_ sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        controller.setInitialText("TestFacebook!")
        controller.add(koreanBeautyImage.image)
        self.present(controller, animated: true, completion: nil)
    }
   
    @IBAction func twitterTapped(_ sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        controller.setInitialText("TestTwitter!")
        controller.add(koreanBeautyImage.image)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func weiboTapped(_ sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        controller.setInitialText("TestWeibo!")
        controller.add(koreanBeautyImage.image)
        self.present(controller, animated: true, completion: nil)
    }
    
}
