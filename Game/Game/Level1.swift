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
    
    var lineb: SKSpriteNode!
    var linet: SKSpriteNode!
    var liner: SKSpriteNode!
    var linel: SKSpriteNode!
    
    let goodCatergory:UInt32 = 0x1 << 0 //1
    let badCategorry:UInt32 = 0x1 << 2 //4
    let wallCategoy:UInt32 = 0x1 << 3 // 6?
    var isPink: Bool = false

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        
        self.backgroundColor = SKColor.orange
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
        //bottom boarder
        lineb = SKSpriteNode(imageNamed: "line2")
        lineb.size = CGSize (width: 500, height: 2)
        lineb.position = CGPoint (x: 0, y: -250)
        lineb.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(lineb)
        lineb.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 500, height: 2))
        lineb.physicsBody?.isDynamic = false
        lineb.physicsBody?.friction = 0
        lineb.physicsBody?.restitution = 1
        lineb.name = "wall"
        
        //topboarder
        linet = SKSpriteNode(imageNamed: "line2")
        linet.size = CGSize (width: 500, height: 2)
        linet.position = CGPoint (x: 0, y: 250)
        linet.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(linet)
        linet.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 500, height: 2))
        linet.physicsBody?.isDynamic = false
        linet.physicsBody?.friction = 0
        linet.physicsBody?.restitution = 1
        linet.name = "wall"
        
        
        
        //rightside baorder
        liner = SKSpriteNode(imageNamed: "line2")
        liner.size = CGSize (width: 20, height: 500)
        liner.position = CGPoint (x: 250, y: 0)
        liner.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        liner.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 20, height: 500))
        liner.physicsBody?.isDynamic = false
        liner.physicsBody?.friction = 1
        liner.physicsBody?.restitution = 1
        liner.physicsBody?.affectedByGravity = false
        self.addChild(liner)
        liner.name = "wall"

        
        //leftside boarder
        linel = SKSpriteNode(imageNamed: "line2")
        linel.size = CGSize (width: 2, height: 500)
        linel.position = CGPoint (x: -250, y: 0)
        linel.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(linel)
        linel.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 2, height: 500))
        linel.physicsBody?.isDynamic = false
        linel.physicsBody?.friction = 0
        linel.physicsBody?.restitution = 1
        linel.name = "wall"


        
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
        bad1.physicsBody?.mass = 1
        
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
        bad2.physicsBody?.mass = 1
        //Apply movement
        good1.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))
        bad1.physicsBody?.applyImpulse(CGVector(dx: -5, dy: -5))
        good2.physicsBody?.applyImpulse(CGVector(dx: 15, dy: -15))
        bad2.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        
        // two
        bad1.physicsBody?.categoryBitMask = badCategorry
        good1.physicsBody?.collisionBitMask = goodCatergory
        bad1.physicsBody?.collisionBitMask = goodCatergory
        good1.physicsBody?.categoryBitMask = goodCatergory
        
        /*lineb.physicsBody?.categoryBitMask = wallCategoy
        lineb.physicsBody?.collisionBitMask = goodCatergory
        linet.physicsBody?.categoryBitMask = wallCategoy
        linet.physicsBody?.collisionBitMask = goodCatergory
        liner.physicsBody?.categoryBitMask = wallCategoy
        liner.physicsBody?.collisionBitMask = goodCatergory
        linel.physicsBody?.categoryBitMask = wallCategoy
        linel.physicsBody?.collisionBitMask = goodCatergory*/
        
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
        
        
    
        if ((firstBody.name == "bad") && (secondBody.name == "good"))
        {
            collisions(good: secondBody, bad: firstBody)
        }
        else if ((firstBody.name == "good") && (secondBody.name == "bad"))
        {
            collisions(good: firstBody, bad: secondBody)
        }
        /*else if ((firstBody.name == "bad") && (secondBody.name == "wall"))
        {
            //boarderCollisions(boarders: firstBody, shape: secondBody)
            print("aaa")
        }
        else if ((firstBody.name == "wall") && (secondBody.name == "bad"))
        {
            //boarderCollisions(boarders: secondBody, shape: firstBody)
            print("aaa")

        }
        else if ((firstBody.name == "wall") && (secondBody.name == "good"))
        {
            //boarderCollisions(boarders: secondBody, shape: firstBody)
            print("aaa")

        }
        else if ((firstBody.name == "good") && (secondBody.name == "wall"))
        {
            //boarderCollisions(boarders: firstBody, shape: secondBody)
            print("aaa")
        }*/

    }
    
    func collisions(good : SKSpriteNode, bad : SKSpriteNode)
    {
        good.texture = SKTexture(imageNamed: "Circle_Pink")
    }
    
    /*func boarderCollisions(boarders : SKSpriteNode, shape : SKSpriteNode)
    {
         print("boarder collisions")
    }*/
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            }
    override func update(_ currentTime: TimeInterval)
    {
        
    }

}
