//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by 张添 on 30/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit
import Social

class GalleryViewController: UIViewController {
 
    var imageName : String?
    
    @IBOutlet weak var beautyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = imageName{
            beautyImage.image = UIImage(named: name)
            navigationItem.title = name
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func shareTapped(_ sender: AnyObject) {
        let controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        controller.setInitialText(imageName)
        controller.add(beautyImage.image)
        self.present(controller, animated: true, completion: nil)
    }
    
}
