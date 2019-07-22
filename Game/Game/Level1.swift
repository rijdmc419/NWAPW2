//
//  Level1.swift
//  Game
//
//  Created by Rij Dorfman on 7/16/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class UIDynamicItemBehavior : UIDynamicBehavior
{
    var attachment: UIAttachmentBehavior?
}


class Level1: SKScene
{
    var good1: SKSpriteNode!
    var bad1: SKSpriteNode!
    var good2 = SKSpriteNode ()
    var bad2 = SKSpriteNode ()
    
    let goodCatergory:UInt32 = 0x1 << 0 //1
    let badCategorry:UInt32 = 0x1 << 2 //4
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.orange
        /*good1 = self.childNode(withName: "Circle1") as! SKSpriteNode
        bad1 = self.childNode(withName: "Square1") as! SKSpriteNode
        good2 = self.childNode(withName: "Circle2") as! SKSpriteNode
        bad2 = self.childNode(withName: "Square2") as! SKSpriteNode*/
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
        good1 = SKSpriteNode(imageNamed: "Circle_White")
        good1.size = CGSize (width: 100, height: 100)
        good1.position = CGPoint (x: 0, y: 0)
        good1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(good1)
        
        good1.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        good1.physicsBody?.isDynamic = true
        good1.physicsBody?.affectedByGravity = false
        good1.physicsBody?.allowsRotation = false
        good1.physicsBody?.linearDamping = 0.0
        good1.physicsBody?.angularDamping = 0.0
        good1.physicsBody?.collisionBitMask = 2
        good1.physicsBody?.categoryBitMask = goodCatergory
        
        
        
        bad1 = SKSpriteNode(imageNamed: "squareish")
        bad1.size = CGSize (width: 100, height: 100)
        bad1.position = CGPoint (x: 150, y: 150)
        bad1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(bad1)
        
        bad1.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        bad1.physicsBody?.isDynamic = true
        bad1.physicsBody?.affectedByGravity = false
        bad1.physicsBody?.allowsRotation = false
        bad1.physicsBody?.linearDamping = 0.0
        bad1.physicsBody?.angularDamping = 0.0
        bad1.physicsBody?.collisionBitMask = 2

        


        
        
        
        
        
        
        
        good1.physicsBody?.applyImpulse(CGVector(dx: 90.0, dy: -90.0))
        bad1.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90.0))
        /*good2.physicsBody?.applyImpulse(CGVector(dx: 90.0, dy: -90.0))
        bad2.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90.0))*/
        
        //var elasticity: CGFloat { get set }
        //class UIDynamicItemBehavior : UIDynamicBehavior
        /*let behavior = UIDynamicItemBehavior(items: [good1 as! UIDynamicItem])
        behavior.elasticity = 1
        animator?.addBehavior(behavior)*/

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /*let gameScene = GameScene(fileNamed: "GameScene")
        gameScene?.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: SKTransition.fade(withDuration: 0.5))*/
    }
    override func update(_ currentTime: TimeInterval)
    {
        
    }

}
