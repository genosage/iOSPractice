//
//  ViewControllerExtension.swift
//  BeautyGallery
//
//  Created by 张添 on 30/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
     return beauties.count
    }
    
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return beauties[row]
    }
    
}
