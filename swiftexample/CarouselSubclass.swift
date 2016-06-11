//
//  CarouselSubclass.swift
//  swiftexample
//
//  Created by Brad G. on 6/11/16.
//  Copyright © 2016 Charcoal Design. All rights reserved.
//
import UIKit

class CarouselSubclass: iCarousel {
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        var inside = false
        for view in self.contentView.subviews
        {
            inside = CGRectContainsPoint(view.frame, point)
            if inside
            {
                return inside
            }
        }
        return inside
    }
    
}
