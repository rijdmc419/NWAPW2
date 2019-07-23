//
//  circleChange.swift
//  Game
//
//  Created by Rij Dorfman on 7/19/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class Shape {
    let shape_sprite: SKSpriteNode
    
    init(shape_sprite: SKSpriteNode) {
        
        self.shape_sprite = shape_sprite
    }

}

class Circle: Shape{
    var isPink: Bool
    var isCircle: Bool
    init(shape_sprite: SKSpriteNode, isPink: Bool = false, isCircle: Bool = true) {
        self.isPink = isPink
        self.isCircle = isCircle
        super.init(shape_sprite: shape_sprite)
    }
}

class Square: Shape{
    //var isThere: Bool
    
    override init(shape_sprite: SKSpriteNode /*, isPink: Bool = false*/) {
        //self.isThere = isThere
        super.init(shape_sprite: shape_sprite)
    }
}
class circleChange: SKScene {
    

    var arraySprites : [Shape]!
    var circ_made1: SKSpriteNode!
    var circ_made2: SKSpriteNode!
    var circ_made3: SKSpriteNode!
    var circ_made4: SKSpriteNode!
    var circ_made5: SKSpriteNode!
    var circ1 : Circle!
    var circ2 : Circle!
    var circ3 : Circle!
    var circ4 : Circle!
    var circ5 : Circle!
    var arrayCircles : [Circle]!
    var square_made1: SKSpriteNode!
    var square_made2: SKSpriteNode!
    var square1 : Square!
    //var score : Int
    //var regualr_guy: SKNode!
     //var sprite_array: [SKSpriteNode] = []
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        
        //circle1 = self.childNode(withName: "circle1") as? SKSpriteNode
        //let circ_made = SKSpriteNode(imageNamed: "Circle_White")
       // background = self.childNode(withName: "background") as? SKSpriteNode
        //circ_made = self.childNode(withName: "Circle_White") as? SKSpriteNode
       
        //for shape in arraySprites {
            
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
        circ_made1 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made1.name = "circ_made1"
        circ_made1.size = CGSize (width: 100, height: 100)
        circ_made1.position = CGPoint (x: 0, y: -150)
        circ_made1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                    self.addChild(circ_made1)
        circ_made1.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circ_made1.physicsBody?.isDynamic = true
        circ_made1.physicsBody?.affectedByGravity = false
        circ_made1.physicsBody?.allowsRotation = false
        circ_made1.physicsBody?.linearDamping = 0.0
        circ_made1.physicsBody?.angularDamping = 0.0
        circ_made1.physicsBody?.restitution = 1.0
        circ_made1.physicsBody?.friction = 0
        circ_made1.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        circ1 = Circle(shape_sprite: circ_made1, isPink: false, isCircle: true)
        
        circ_made2 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made2.name = "circ_made2"
        circ_made2.size = CGSize (width: 100, height: 100)
        circ_made2.position = CGPoint (x: 0, y: 30)
        circ_made2.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                   self.addChild(circ_made2)
        circ_made2.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circ_made2.physicsBody?.isDynamic = true
        circ_made2.physicsBody?.affectedByGravity = false
        circ_made2.physicsBody?.allowsRotation = false
        circ_made2.physicsBody?.linearDamping = 0.0
        circ_made2.physicsBody?.angularDamping = 0.0
        circ_made2.physicsBody?.restitution = 1.0
        circ_made2.physicsBody?.friction = 0
        circ_made2.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        circ2 = Circle(shape_sprite: circ_made2, isPink: false, isCircle: true)
        
        circ_made3 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made3.name = "circ_made3"
        circ_made3.size = CGSize (width: 100, height: 100)
        circ_made3.position = CGPoint (x: 0, y: 400)
        circ_made3.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                    self.addChild(circ_made3)
        circ_made3.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circ_made3.physicsBody?.isDynamic = true
        circ_made3.physicsBody?.affectedByGravity = false
        circ_made3.physicsBody?.allowsRotation = false
        circ_made3.physicsBody?.linearDamping = 0.0
        circ_made3.physicsBody?.angularDamping = 0.0
        circ_made3.physicsBody?.restitution = 1.0
        circ_made3.physicsBody?.friction = 0
        circ_made3.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        circ3 = Circle(shape_sprite: circ_made3, isPink: false, isCircle: true)
        
        circ_made4 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made4.name = "circ_made4"
        circ_made4.size = CGSize (width: 100, height: 100)
        circ_made4.position = CGPoint (x: 0, y: 200)
        circ_made4.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(circ_made4)
        circ_made4.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circ_made4.physicsBody?.isDynamic = true
        circ_made4.physicsBody?.affectedByGravity = false
        circ_made4.physicsBody?.allowsRotation = false
        circ_made4.physicsBody?.linearDamping = 0.0
        circ_made4.physicsBody?.angularDamping = 0.0
        circ_made4.physicsBody?.restitution = 1.0
        circ_made4.physicsBody?.friction = 0
        circ_made4.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        circ4 = Circle(shape_sprite: circ_made4, isPink: false, isCircle: true)
        
        circ_made5 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made5.name = "circ_made5"
        circ_made5.size = CGSize (width: 100, height: 100)
        circ_made5.position = CGPoint (x: 0, y: 100)
        circ_made5.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(circ_made5)
        circ_made5.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circ_made5.physicsBody?.isDynamic = true
        circ_made5.physicsBody?.affectedByGravity = false
        circ_made5.physicsBody?.allowsRotation = false
        circ_made5.physicsBody?.linearDamping = 0.0
        circ_made5.physicsBody?.angularDamping = 0.0
        circ_made5.physicsBody?.restitution = 1.0
        circ_made5.physicsBody?.friction = 0
        circ_made5.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        circ5 = Circle(shape_sprite: circ_made5, isPink: false, isCircle: true)
        
        //regualr_guy.addChild(circ_made1)
        
        
        
        square_made1 = SKSpriteNode(imageNamed: "square_white")
        square_made1.name = "square_made1"
        square_made1.size = CGSize (width: 100, height: 100)
        square_made1.position = CGPoint (x: 0, y: 0)
        square_made1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                    self.addChild(square_made1)
        square_made1.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 100))
        square_made1.physicsBody?.isDynamic = true
        square_made1.physicsBody?.affectedByGravity = false
        square_made1.physicsBody?.allowsRotation = false
        square_made1.physicsBody?.linearDamping = 0.0
        square_made1.physicsBody?.angularDamping = 0.0
        square_made1.physicsBody?.restitution = 1.0
        square_made1.physicsBody?.friction = 0
        square_made1.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))

        square_made2 = SKSpriteNode(imageNamed: "square_white")
        square_made2.name = "square_made2"
        square_made2.size = CGSize (width: 100, height: 100)
        square_made2.position = CGPoint (x: 0, y: 0)
        square_made2.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                   self.addChild(square_made2)
        square_made2.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 100))
        square_made2.physicsBody?.isDynamic = true
        square_made2.physicsBody?.affectedByGravity = false
        square_made2.physicsBody?.allowsRotation = false
        square_made2.physicsBody?.linearDamping = 0.0
        square_made2.physicsBody?.angularDamping = 0.0
        square_made2.physicsBody?.restitution = 1.0
        square_made2.physicsBody?.friction = 0
        square_made2.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        
        //arraySprites.append(circ)
        arrayCircles = [circ1, circ2, circ3, circ4, circ5]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let clickedNodes = self.nodes(at: location)
                
            print("part1")
            
            if clickedNodes.first?.name == "circ_made1" {
                if circ1.isPink == false {
                    print("part2")
                    changetoPink(circle_shape: circ_made1)
                    circ1.isPink = true
                }
               
                print("part3")
            }
            
            if clickedNodes.first?.name == "circ_made2" {
                if circ2.isPink == false {
                    print("part2")
                    changetoPink(circle_shape: circ_made2)
                    circ2.isPink = true
                }
                
                print("part3")
            }
            
            if clickedNodes.first?.name == "circ_made3" {
                if circ3.isPink == false {
                    print("part2")
                    changetoPink(circle_shape: circ_made3)
                    circ3.isPink = true
                }
                
                print("part3")
            }
            
            if clickedNodes.first?.name == "circ_made4" {
                if circ4.isPink == false {
                    print("part2")
                    changetoPink(circle_shape: circ_made4)
                    circ4.isPink = true
                }
                
                print("part3")
            }
            
            if clickedNodes.first?.name == "circ_made5" {
                if circ5.isPink == false {
                    print("part2")
                    changetoPink(circle_shape: circ_made5)
                    circ5.isPink = true
                }
                
                print("part3")
            }
            
            if clickedNodes.first?.name == "square_made1" {
                square_made1.alpha = 0
                square_made1.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 00,height: 00))
                
            }
            
            if clickedNodes.first?.name == "square_made2" {
                square_made2.alpha = 0
                square_made2.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 00,height: 00))
                
            }
            var score = 0
            for item in arrayCircles {
                
                if item.isCircle == true {
                
                    if item.isPink == true {
                        
                        score = score+1
                        if score >= 3 {
                            // open level completed scene, or reveal next level button
                            print("you win!")
                        }
                    }
                }
            }
            
        }
        
        /*
        let gameScene = GameScene(fileNamed: "GameScene")
        gameScene?.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: SKTransition.fade(withDuration: 0.5))
         */
    }
    
    func changetoPink(circle_shape: SKSpriteNode) {
            circle_shape.texture = SKTexture(imageNamed: "Circle_Pink")
            print("Hi")
    }
    
    
    
    /*
    func makeCircSprite() {
        
        circ_made1 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made1.name = "circ_made1"
        circ_made1.size = CGSize (width: 100, height: 100)
        circ_made1.position = CGPoint (x: 0, y: 200)
        circ_made1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(circ_made1)
        circ_made1.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circ_made1.physicsBody?.isDynamic = true
        circ_made1.physicsBody?.affectedByGravity = false
        circ_made1.physicsBody?.allowsRotation = false
        circ_made1.physicsBody?.linearDamping = 0.0
        circ_made1.physicsBody?.angularDamping = 0.0
        circ_made1.physicsBody?.restitution = 1.0
        circ_made1.physicsBody?.friction = 0
    }
 */
}





