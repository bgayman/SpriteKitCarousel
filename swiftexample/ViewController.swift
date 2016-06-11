//
//  ViewController.swift
//  SwiftExample
//
//  Created by Nick Lockwood on 30/07/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate{

    var images : NSMutableArray = NSMutableArray()
    var gameScene = GameScene()
    @IBOutlet weak var carousel: iCarousel!

    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func showCarousel(){
        carousel.hidden = false
    }
    func hideCarousel(){
        carousel.hidden = true
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        images = NSMutableArray(array: ["square1","square2","square3"])
    }
    
    func carousel(carousel:iCarousel, didSelectItemAtIndex index:NSInteger){
        
        let scene = GameScene(size:self.view.bounds.size)
        
        scene.imageName = self.images[index] as! String
        self.hideCarousel()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .CoverFlow
        carousel.reloadData()
        
        let spriteKitView = SKView()
        spriteKitView.frame = self.view.bounds
        self.view.insertSubview(spriteKitView, belowSubview: self.carousel)
        
        spriteKitView.showsFPS = true
        spriteKitView.showsNodeCount = true
        spriteKitView.ignoresSiblingOrder = true
        
        let scene = GameScene(size:self.view.bounds.size)
        scene.scaleMode = .AspectFill
        scene.imageName = self.images[0] as! String
        
        self.carousel.hidden = true
        spriteKitView.presentScene(scene)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.showCarousel), name: scene.kShowNotification, object: nil)
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int{
        return images.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView{
        
        var itemView: UIImageView
        
        if (view == nil){
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:200, height:200))
            itemView.contentMode = .Center
        }
        else{
            itemView = view as! UIImageView;
        }
        
        itemView.image = UIImage(named: "\(images.objectAtIndex(index))")
        return itemView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat{
        
        if (option == .Spacing){
            return value * 2
        }
        
        return value
    }
}