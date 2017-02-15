//
//  TodoModel.swift
//  Todo
//
//  Created by 张添 on 1/10/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import Foundation
import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init(id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
