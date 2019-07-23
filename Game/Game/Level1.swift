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

class Level1: SKScene, SKPhysicsContactDelegate
{
    var good1: SKSpriteNode!
    var bad1: SKSpriteNode!
    
    var good2: SKSpriteNode!
    var bad2: SKSpriteNode!
    
    let goodCatergory:UInt32 = 0x1 << 0 //1
    let badCategorry:UInt32 = 0x1 << 2 //4
    var isPink: Bool = false

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        
        self.backgroundColor = SKColor.orange
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
       //Good One
        good1 = SKSpriteNode(imageNamed: "Circle_White")
        good1.size = CGSize (width: 50, height: 50)
        good1.position = CGPoint (x: 0, y: 0)
        good1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(good1)
        good1.name = "good"
        
        good1.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        good1.physicsBody?.isDynamic = true
        good1.physicsBody?.affectedByGravity = false
        good1.physicsBody?.allowsRotation = false
        good1.physicsBody?.linearDamping = 0.0
        good1.physicsBody?.angularDamping = 0.0
        good1.physicsBody?.restitution = 1.0
        good1.physicsBody?.friction = 0
        
        
        //Good Two
        
        good2 = SKSpriteNode(imageNamed: "Circle_White")
        good2.size = CGSize (width: 50, height: 50)
        good2.position = CGPoint (x: -200, y: 0)
        good2.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(good2)
        good2.name = "good"
        
        good2.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        good2.physicsBody?.isDynamic = true
        good2.physicsBody?.affectedByGravity = false
        good2.physicsBody?.allowsRotation = false
        good2.physicsBody?.linearDamping = 0.0
        good2.physicsBody?.angularDamping = 0.0
        good2.physicsBody?.restitution = 1.0
        good2.physicsBody?.friction = 0
        
        //BAd 1
        bad1 = SKSpriteNode(imageNamed: "squareish")
        bad1.size = CGSize (width: 50, height: 50)
        bad1.position = CGPoint (x: 200, y: 200)
        bad1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(bad1)
        bad1.name = "bad"
        
        bad1.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 50, height: 50))
        bad1.physicsBody?.isDynamic = true
        bad1.physicsBody?.affectedByGravity = false
        bad1.physicsBody?.allowsRotation = false
        bad1.physicsBody?.linearDamping = 0.0
        bad1.physicsBody?.angularDamping = 0.0
        bad1.physicsBody?.restitution = 1.0
        bad1.physicsBody?.friction = 0
        
        //Bad2
        bad2 = SKSpriteNode(imageNamed: "squareish")
        bad2.size = CGSize (width: 50, height: 50)
        bad2.position = CGPoint (x: 200, y: -200)
        bad2.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(bad2)
        bad2.name = "bad"
        
        bad2.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 50, height: 50))
        bad2.physicsBody?.isDynamic = true
        bad2.physicsBody?.affectedByGravity = false
        bad2.physicsBody?.allowsRotation = false
        bad2.physicsBody?.linearDamping = 0.0
        bad2.physicsBody?.angularDamping = 0.0
        bad2.physicsBody?.restitution = 1.0
        bad2.physicsBody?.friction = 0
        
        //Apply movement
        good1.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))
        bad1.physicsBody?.applyImpulse(CGVector(dx: -15, dy: -15))
        good2.physicsBody?.applyImpulse(CGVector(dx: 15, dy: -15))
        bad2.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))
        
        // two
        bad1.physicsBody?.categoryBitMask = badCategorry
        good1.physicsBody?.collisionBitMask = goodCatergory
        bad1.physicsBody?.collisionBitMask = goodCatergory
        good1.physicsBody?.categoryBitMask = goodCatergory

        bad1.physicsBody?.contactTestBitMask = goodCatergory
        
        //four
        bad2.physicsBody?.categoryBitMask = badCategorry
        good2.physicsBody?.collisionBitMask = goodCatergory
        bad2.physicsBody?.collisionBitMask = goodCatergory
        good2.physicsBody?.categoryBitMask = goodCatergory
        
        bad2.physicsBody?.contactTestBitMask = goodCatergory
    
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        let firstBody = contact.bodyA.node as! SKSpriteNode
        let secondBody = contact.bodyB.node as! SKSpriteNode
    
        if ((firstBody.name == "good") && (secondBody.name == "bad"))
        {
            collisions(good: firstBody, bad: secondBody)
        }
        else if ((firstBody.name == "bad") && (secondBody.name == "good"))
        {
            collisions(good: secondBody, bad: firstBody)
        }

    }
    
    func collisions(good : SKSpriteNode, bad : SKSpriteNode)
    {
        good.size = CGSize (width: 100, height: 100)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            }
    override func update(_ currentTime: TimeInterval)
    {
        
    }

}
