//
//  MapViewController.swift
//  Test Welcome
//
//  Created by 张添 on 24/09/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit
import Foundation

class MapworkViewController: UIViewController {
    
    var imageView = UIImageView()
    var expanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tap:")
        tapGestureRecognizer.numberOfTapsRequired = 2
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "pinch:")
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "pan:")
        
        let rotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: "rotation:")
        
        imageView = UIImageView(frame: CGRectMake(100, 100, 100, 100))
        imageView.image = UIImage(named: "map")
        self.view.addSubview(imageView)
        
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.addGestureRecognizer(pinchGestureRecognizer)
        imageView.addGestureRecognizer(panGestureRecognizer)
        imageView.addGestureRecognizer(rotationGestureRecognizer)
    }
    
    func tap(gestureRecognizer:UITapGestureRecognizer){
        
        var frame = imageView.frame
        
        if (!expanded) {
            frame.size.height = frame.size.height * 2
            frame.size.width = frame.size.width * 2
            expanded = true
        } else {
            frame.size.height = frame.size.height / 2
            frame.size.width = frame.size.width / 2
            expanded = false
        }
        
        imageView.frame = frame
    }
    
    func pinch(gestureRecognizer: UIPinchGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.Began || gestureRecognizer.state == UIGestureRecognizerState.Changed {
            imageView.transform = CGAffineTransformScale(imageView.transform, gestureRecognizer.scale, gestureRecognizer.scale)
            gestureRecognizer.scale = 1
        }
    }
  
    func pan(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.Began || gestureRecognizer.state == UIGestureRecognizerState.Changed {
            let translation = gestureRecognizer.translationInView(imageView.superview!)
            imageView.center = CGPointMake(imageView.center.x + translation.x, imageView.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPointZero, inView: imageView.superview)
        }
    }

    
    func rotation(gestureRecognizer: UIRotationGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.Began || gestureRecognizer.state == UIGestureRecognizerState.Changed {
            imageView.transform = CGAffineTransformRotate(imageView.transform, gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }

    
}