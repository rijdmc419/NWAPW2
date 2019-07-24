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
    var level_doneButton: SKSpriteNode!
    var restartButton: SKSpriteNode!

    //var regualr_guy: SKNode!
     //var sprite_array: [SKSpriteNode] = []
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        
        //circle1 = self.childNode(withName: "circle1") as? SKSpriteNode
        //let circ_made = SKSpriteNode(imageNamed: "Circle_White")
       // background = self.childNode(withName: "background") as? SKSpriteNode
        //circ_made = self.childNode(withName: "Circle_White") as? SKSpriteNode
       
        //for shape in arraySprites {
        
        level_doneButton = SKSpriteNode(imageNamed: "square_white")
        level_doneButton.name = "levelButton"
        level_doneButton.alpha = 0
        level_doneButton.size = CGSize (width: 120, height: 60)
        level_doneButton.position = CGPoint (x: -200, y: 610)
        level_doneButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        level_doneButton.zPosition = 2
        self.addChild(level_doneButton)
        
        restartButton = SKSpriteNode(imageNamed: "square_white")
        restartButton.name = "restartButton"
        restartButton.alpha = 1
        restartButton.size = CGSize (width: 120, height: 60)
        restartButton.position = CGPoint (x: 210, y: 610)
        restartButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        restartButton.zPosition = 2
        self.addChild(restartButton)
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
        circ_made1 = SKSpriteNode(imageNamed: "Circle_White")
        circ_made1.name = "circ_made1"
        
        circ_made1.userData = [
            "isPink" : false,
            "isCircle" : true
        ];
        
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
        circ_made3.name = "circle"
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
            square_made1.userData = [
                "isCircle" : false
        ];
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
        square_made1.userData = [
            "isCircle" : false
        ];
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
        
        for item in arrayCircles {
            
            item.shape_sprite.userData = [
                "isPink" : false,
                "isCircle" : true
            ];
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let clickedNodes = self.nodes(at: location)
                
            print("part1")
            
            if clickedNodes.first?.userData?.value(forKey: "isCircle") as? Bool == true {
                let check = clickedNodes.first?.userData?.value(forKey: "isPink") as? Bool
                if check == false {
                    print("part2")
                    changetoPink(circle_shape: clickedNodes.first as! SKSpriteNode)
                    clickedNodes.first?.userData?.setValue(true, forKey: "isPink")
                }
               
                print("part3")
            }
           
            if clickedNodes.first?.userData?.value(forKey: "isCircle") as? Bool == false {
                clickedNodes.first?.alpha = 0
                clickedNodes.first?.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 00,height: 00))
                
            }
            
            if clickedNodes.first?.name == "restartButton" {
                
                let circlechange = circleChange(fileNamed: "circleChange")
                circlechange?.scaleMode = .aspectFill
                self.view?.presentScene(circlechange!, transition: SKTransition.fade(withDuration: 0.5))
                
            }
            var numPinkCirc = 0
            for item in arrayCircles {
                
                if item.shape_sprite.userData?.value(forKey: "isCircle") as? Bool == true {
                
                    if item.shape_sprite.userData?.value(forKey: "isPink") as? Bool == true {
                        
                        numPinkCirc = numPinkCirc+1
                        if numPinkCirc >= 3 {
                            // open level completed scene, or reveal next level button
                            print("you win!")
                            level_doneButton.alpha = 1
                            if clickedNodes.first?.name == "levelButton" {
                                
                                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let levelDone = mainStoryboard.instantiateViewController(withIdentifier: "level_done") //as! Page2
                                //self.present(page2, animated: true)
                                self.view!.window?.rootViewController?.present(levelDone, animated: true, completion: nil)
                            }
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





