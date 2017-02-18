//
//  Publisher.h
//  News
//
//  Created by 张添 on 18/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Publisher : NSObject

@property NSString *title;
@property NSString *url;

@end


/*
 import UIKit
 
 class Publisher
 {
 var title: String
 var url: String
 var image: UIImage
 var section: String
 
 init(title: String, url: String, image: UIImage, section: String)
 {
 self.title = title
 self.url = url
 self.image = image
 self.section = section
 }
 
 convenience init(copies publisher: Publisher)
 {
 self.init(title: publisher.title, url: publisher.url, image: publisher.image, section: publisher.section)
 }
 }

*/
