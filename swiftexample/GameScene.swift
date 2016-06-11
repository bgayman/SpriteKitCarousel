//
//  GameScene.swift
//  swiftexample
//
//  Created by Brad G. on 6/11/16.
//  Copyright © 2016 Charcoal Design. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var imageName = "square1"{
        didSet{
            self.childNode.texture = SKTexture(imageNamed: imageName)
        }
    }
    
    let kShowNotification = "showPicker"
    
    var childNode = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.childNode = SKSpriteNode(imageNamed: imageName)
        self.childNode.anchorPoint = CGPointZero
        self.childNode.position = CGPoint(x: self.frame.width / 2 - childNode.frame.width / 2, y: self.frame.height / 2 - childNode.frame.height / 2)
        self.addChild(self.childNode)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.showCharPicker()
    }
    
    func showCharPicker(){
        NSNotificationCenter.defaultCenter().postNotificationName(kShowNotification, object: nil)
    }
    
}
