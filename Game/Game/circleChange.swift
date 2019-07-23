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
    
    init(shape_sprite: SKSpriteNode, isPink: Bool = false) {
        self.isPink = isPink
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
    var circ1 : Circle!
    var square_made1: SKSpriteNode!
    var square1 : Square!
    var regualr_guy: SKNode!
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
        
        circ_made1.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))

        
        //regualr_guy.addChild(circ_made1)
        
        circ1 = Circle(shape_sprite: circ_made1, isPink: false)
        
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

        
        //arraySprites.append(circ)
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
            
            if clickedNodes.first?.name == "square_made1" {
                square_made1.alpha = 0
                
                
            }
            
            //make square go away!!!
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
}





