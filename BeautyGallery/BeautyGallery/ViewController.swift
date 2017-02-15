//
//  ViewController.swift
//  BeautyGallery
//
//  Created by 张添 on 30/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beautyPicker: UIPickerView!
    
    let beauties = ["fanbingbing","libingbing","wangfei","yangmi","zhouxun"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        beautyPicker.dataSource = self
        beautyPicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToGallery"{
            
            let index = beautyPicker.selectedRow(inComponent: 0)
            
            var imageName : String?
            switch index{
            case 0:
                imageName = "fanbingbing"
            case 1:
                imageName = "libingbing"
            case 2:
                imageName = "wangfei"
            case 3:
                imageName = "yangmi"
            case 4:
                imageName = "zhouxun"
            default:
                imageName = nil
            }
            
            let vc = segue.destination as! GalleryViewController
            vc.imageName = imageName
        }
    }
    
    @IBAction func close(_ segue: UIStoryboardSegue){
        var sourcevc = segue.source as! GalleryViewController
    }

}

