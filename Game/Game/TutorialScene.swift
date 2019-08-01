//
//  Level1.swift
//  Game
//
//  Created by Amelia Ellis on 7/26/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit


class TutorialScene: SKScene, SKPhysicsContactDelegate {
    
    
    var arraySprites : [Shape]!
    let goodCategory:UInt32 = 0x1 << 0 //1
    let badCategory:UInt32 = 0x1 << 2 //4
    var lineb: SKSpriteNode!
    var linet: SKSpriteNode!
    var liner: SKSpriteNode!
    var linel: SKSpriteNode!
    var circ_made1: SKSpriteNode!
    var circ1 : Circle!
    var arrayCircles : [Circle]!
    var square_made1: SKSpriteNode!
    var level_doneButton: SKSpriteNode!
    var restartButton: SKSpriteNode!
    var background: SKSpriteNode!
    var goal: SKNode!
    //var goal_circle: SKSpriteNode!
    var allowclick = true
    var no_move = false
    var nextcollider: SKSpriteNode!
    var firsttouch = false
    var secondtouch = false
    var thirdtouch = false
    //var text : [SKNode]!
    var stuff1: SKLabelNode!
    var stuff2: SKLabelNode!
    var arrow : SKSpriteNode!
    var numPinkCirc = 0
    var fourthtouch = false
    
    override func didMove(to view: SKView) {
        background = SKSpriteNode(imageNamed: "Pad_Background")
        background?.size = CGSize (width: 750, height: 1334)
        self.addChild(background)
        background.zPosition = -1
        self.physicsWorld.contactDelegate = self
        
        level_doneButton = SKSpriteNode(imageNamed: "done_button")
        level_doneButton.name = "levelButton"
        level_doneButton.alpha = 1
        level_doneButton.size = CGSize (width: 120, height: 60)
        level_doneButton.position = CGPoint (x: -220, y: 613)
        level_doneButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        level_doneButton.zPosition = 2
        self.addChild(level_doneButton)
        
        restartButton = SKSpriteNode(imageNamed: "restart_button")
        restartButton.name = "restartButton"
        restartButton.alpha = 1
        restartButton.size = CGSize (width: 55, height: 55)
        restartButton.position = CGPoint (x: 230, y: 620)
        restartButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        restartButton.zPosition = 2
        self.addChild(restartButton)
        
        //bottom boarder
        lineb = SKSpriteNode(imageNamed: "line2")
        lineb.size = CGSize (width: 600, height: 2)
        lineb.position = CGPoint (x: 0, y: -365)
        lineb.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(lineb)
        lineb.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 600, height: 2))
        lineb.physicsBody?.isDynamic = false
        lineb.physicsBody?.friction = 0
        lineb.physicsBody?.restitution = 1
        lineb.name = "wall"
        lineb.alpha = 0
        
        //topboarder
        linet = SKSpriteNode(imageNamed: "line2")
        linet.size = CGSize (width: 600, height: 2)
        linet.position = CGPoint (x: 0, y: 550)
        linet.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(linet)
        linet.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 600, height: 2))
        linet.physicsBody?.isDynamic = false
        linet.physicsBody?.friction = 0
        linet.physicsBody?.restitution = 1
        linet.name = "wall"
        linet.alpha = 0

        
        
        //rightside baorder
        liner = SKSpriteNode(imageNamed: "line2")
        liner.size = CGSize (width: 2, height: 1100)
        liner.position = CGPoint (x: 300, y: 0)
        liner.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        liner.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 20, height: 1100))
        liner.physicsBody?.isDynamic = false
        liner.physicsBody?.friction = 1
        liner.physicsBody?.restitution = 1
        liner.physicsBody?.affectedByGravity = false
        self.addChild(liner)
        liner.name = "wall"
        liner.alpha = 0

        
        //leftside boarder
        linel = SKSpriteNode(imageNamed: "line2")
        linel.size = CGSize (width: 2, height: 1100)
        linel.position = CGPoint (x: -300, y: 0)
        linel.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(linel)
        linel.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 2, height: 1100))
        linel.physicsBody?.isDynamic = false
        linel.physicsBody?.friction = 0
        linel.physicsBody?.restitution = 1
        linel.name = "wall"
        linel.alpha = 0

    
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
        goal = SKNode()
        goal.position = CGPoint (x: 0, y: 480)
        self.addChild(goal)
        let goal_circle = SKSpriteNode(imageNamed: "happyface")
        goal_circle.size = CGSize (width: 80, height: 80)
        goal_circle.position = CGPoint (x: 10, y: 0)
        let goal_label = SKLabelNode()
        goal_label.text = ("1")
        goal_label.fontColor = UIColor.black
        goal_label.position = CGPoint (x: -70, y: -25)
        goal_label.fontSize = 80
        goal_label.fontName = "ChalkDuster"
        goal.addChild(goal_circle)
        goal.addChild(goal_label)
        
        circ_made1 = SKSpriteNode(imageNamed: "mehface2")
        circ_made1.name = "circle"
        
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
        //circ_made1.physicsBody?.applyImpulse(CGVector(dx: 90, dy: 90))
        circ1 = Circle(shape_sprite: circ_made1, isPink: false, isCircle: true)
        circ_made1.alpha = 0

        square_made1 = SKSpriteNode(imageNamed: "angryface")
        square_made1.name = "square"
        square_made1.userData = [
            "isCircle" : false
        ];
        square_made1.size = CGSize (width: 100, height: 100)
        square_made1.position = CGPoint (x: 0, y: 150)
        square_made1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        square_made1.alpha = 0
        self.addChild(square_made1)
        square_made1.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 100))
        square_made1.physicsBody?.isDynamic = true
        square_made1.physicsBody?.affectedByGravity = false
        square_made1.physicsBody?.allowsRotation = false
        square_made1.physicsBody?.linearDamping = 0.0
        square_made1.physicsBody?.angularDamping = 0.0
        square_made1.physicsBody?.restitution = 1.0
        square_made1.physicsBody?.friction = 0
        square_made1.physicsBody?.mass = 1
        //square_made1.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        square_made1.physicsBody?.categoryBitMask = goodCategory
        square_made1.physicsBody?.collisionBitMask = goodCategory
        square_made1.physicsBody?.contactTestBitMask = goodCategory
        
        nextcollider = SKSpriteNode(imageNamed: "square_white")
        nextcollider.name = "next"
        nextcollider.alpha = 0
        nextcollider.size = CGSize (width: 100, height: 900)
        nextcollider.position = CGPoint (x: 330, y: 00)
        nextcollider.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(nextcollider)
        nextcollider.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 900))
        nextcollider.physicsBody?.isDynamic = false
        nextcollider.physicsBody?.affectedByGravity = false
        nextcollider.physicsBody?.allowsRotation = false
        nextcollider.physicsBody?.linearDamping = 0.0
        nextcollider.physicsBody?.angularDamping = 0.0
        nextcollider.physicsBody?.restitution = 1.0
        nextcollider.physicsBody?.friction = 0
        nextcollider.physicsBody?.categoryBitMask = goodCategory
        nextcollider.physicsBody?.collisionBitMask = goodCategory
        nextcollider.physicsBody?.contactTestBitMask = goodCategory
        
        arrayCircles = [circ1]
        
        for item in arrayCircles
        {
            
            item.shape_sprite.userData = [
                "isPink" : false,
                "isCircle" : true
            ];
            
            item.shape_sprite.physicsBody?.collisionBitMask = goodCategory
            item.shape_sprite.physicsBody?.categoryBitMask = goodCategory
            item.shape_sprite.physicsBody?.mass = 1
            
        }
    }
    func didBegin(_ contact: SKPhysicsContact)
    {
        let firstBody = contact.bodyA.node as! SKSpriteNode
        let secondBody = contact.bodyB.node as! SKSpriteNode
        
        print("hello")
        
        
        if ((firstBody.name == "square") && (secondBody.name == "circle"))
        {
            collisions(circle: secondBody, square: firstBody)
            print("hi")
            
        }
        else if ((firstBody.name == "circle") && (secondBody.name == "square"))
        {
            collisions(circle: firstBody, square: secondBody)
            print("hi")
            
        }
        else if ((firstBody.name == "circle") && (secondBody.name == "next"))
        {
            print("nextnextnextnextnextnextnextnext")
            no_move = stopGame(shape1: circ_made1, shape2: square_made1)
            
        }
        else if ((firstBody.name == "square") && (secondBody.name == "next"))
        {
            print("nextnextnextnextnextnextnextnext")
            no_move = stopGame(shape1: circ_made1, shape2: square_made1)
        }
    }
    func collisions(circle : SKSpriteNode, square : SKSpriteNode)
    {
        print("coollision")
        if circle.userData?.value(forKey: "isPink") as? Bool == false
        {
            print("loop1")
            if circle.userData?.value(forKey: "isCircle") as? Bool == true
            {
                print("loop2")
                //turn to square
                circle.texture = SKTexture(imageNamed: "angryface")
                let velocityx = circle.physicsBody?.velocity.dx
                let velocityy = circle.physicsBody?.velocity.dy
                circle.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 100))
                circle.physicsBody?.isDynamic = true
                circle.physicsBody?.affectedByGravity = false
                circle.physicsBody?.allowsRotation = false
                circle.physicsBody?.linearDamping = 0.0
                circle.physicsBody?.angularDamping = 0.0
                circle.physicsBody?.restitution = 1
                circle.physicsBody?.friction = 0
                circle.physicsBody?.mass = 1
                circle.physicsBody?.velocity = CGVector(dx: velocityx!,dy: velocityy!)
                circle.userData?.setValue(false, forKey: "isCircle")
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
       
        if let location = touch?.location(in: self) {
            let clickedNodes = self.nodes(at: location)
            if firsttouch == false {
                
                circ_made1.alpha = 1
                
                stuff1 = self.childNode(withName: "first1") as? SKLabelNode
                stuff2 = self.childNode(withName: "first2") as? SKLabelNode
                arrow = self.childNode(withName: "first_arrow") as? SKSpriteNode
               //goal goes away
                disappearText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
               
                stuff1 = self.childNode(withName: "second1") as? SKLabelNode
                stuff2 = self.childNode(withName: "second2") as? SKLabelNode
                arrow = self.childNode(withName: "second_arrow") as? SKSpriteNode
                 //now asks to click circle
                newText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                firsttouch = true
            }
            else if secondtouch == false && circ_made1.userData?.value(forKey: "isPink") as? Bool == true {
                //if circle is clicked
                stuff1 = self.childNode(withName: "second1") as? SKLabelNode
                stuff2 = self.childNode(withName: "second2") as? SKLabelNode
                arrow = self.childNode(withName: "second_arrow") as? SKSpriteNode
                disappearText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                //square appears
                square_made1.alpha = 1
                
                stuff1 = self.childNode(withName: "third1") as? SKLabelNode
                stuff2 = self.childNode(withName: "third2") as? SKLabelNode
                arrow = self.childNode(withName: "third_arrow") as? SKSpriteNode
                //square text shows up
                newText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                secondtouch = true
            }
            else if secondtouch == true && square_made1.alpha == 0 && no_move == false {
                allowclick = false
                disappearText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                stuff1 = self.childNode(withName: "fourth1") as? SKLabelNode
                stuff2 = self.childNode(withName: "fourth2") as? SKLabelNode
                arrow.position = CGPoint (x: 2000, y: 2000)
                newText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                circ_made1.position = CGPoint (x: -200, y: 200)
                circ_made1.physicsBody?.applyImpulse(CGVector(dx: 70, dy: -70))
                circ_made1.texture = SKTexture(imageNamed: "mehface2")
                circ_made1.userData?.setValue(false, forKey: "isPink")
                
                square_made1.alpha = 1
                square_made1.position = CGPoint (x: 200, y: -200)
                square_made1.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 100))
                square_made1.physicsBody?.applyImpulse(CGVector(dx: -70, dy: 70))
                square_made1.physicsBody?.affectedByGravity = false
                square_made1.physicsBody?.contactTestBitMask = goodCategory
                square_made1.physicsBody?.allowsRotation = false
                
            }
            else if thirdtouch == false && no_move == true
            {
                print("Sup")
                allowclick = true
                disappearText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                stuff1 = self.childNode(withName: "fifth1") as? SKLabelNode
                stuff2 = self.childNode(withName: "fifth2") as? SKLabelNode
                newText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                
                circ_made1.alpha = 1
                circ_made1.position = CGPoint (x: -200, y: 200)
                circ_made1.texture = SKTexture(imageNamed: "mehface2")
                circ_made1.userData?.setValue(false, forKey: "isPink")
                circ_made1.userData?.setValue(true, forKey: "isCircle")
                circ_made1.physicsBody?.isDynamic = false
    
                square_made1.alpha = 1
                square_made1.position = CGPoint (x: 200, y: -200)
                square_made1.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 100,height: 100))
                square_made1.physicsBody?.affectedByGravity = false
                square_made1.physicsBody?.isDynamic = false
                square_made1.physicsBody?.contactTestBitMask = goodCategory
                square_made1.physicsBody?.allowsRotation = false
                
                thirdtouch = true
            }
            else if thirdtouch == true && circ_made1.userData?.value(forKey: "isPink") as? Bool == false {
                print("help")
                allowclick = true
                no_move = false
            }
            else if fourthtouch == false && circ_made1.userData?.value(forKey: "isPink") as? Bool == true && thirdtouch == true{
                print("yeet")
                allowclick = false
                
                circ_made1.physicsBody = SKPhysicsBody(circleOfRadius: 50)
                circ_made1.physicsBody?.isDynamic = true
                circ_made1.physicsBody?.affectedByGravity = false
                circ_made1.physicsBody?.allowsRotation = false
                circ_made1.physicsBody?.linearDamping = 0.0
                circ_made1.physicsBody?.angularDamping = 0.0
                circ_made1.physicsBody?.restitution = 1.0
                circ_made1.physicsBody?.friction = 0
                circ_made1.physicsBody?.applyImpulse(CGVector(dx: 70, dy: -70))
                square_made1.physicsBody?.isDynamic = true
                square_made1.physicsBody?.applyImpulse(CGVector(dx: -70, dy: 70))
                fourthtouch = true
                
            }
            else if fourthtouch == true && no_move == true {
                disappearText(stuff1: stuff1, stuff2: stuff2, arrow: arrow)
                let touch_anywhere = self.childNode(withName: "touch_anywhere") as? SKLabelNode
                touch_anywhere?.text = "Click done to go to the main menu"
            }
            
            print("part1")
            
            if clickedNodes.first?.userData?.value(forKey: "isCircle") as? Bool == true && allowclick == true {
                
                let check = clickedNodes.first?.userData?.value(forKey: "isPink") as? Bool
                if check == false {
                    print("part2")
                    changetoPink(circle_shape: clickedNodes.first as! SKSpriteNode)
                    clickedNodes.first?.userData?.setValue(true, forKey: "isPink")
                }
                
                print("part3")
            }
            
            if clickedNodes.first?.userData?.value(forKey: "isCircle") as? Bool == false && allowclick == true && thirdtouch == false
            {
                clickedNodes.first?.alpha = 0
                clickedNodes.first?.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 00,height: 00))
                
            }
            
            if clickedNodes.first?.name == "restartButton"
            {
                
                let level1 = TutorialScene(fileNamed: "TutorialScene")
                level1?.scaleMode = .aspectFill
                self.view?.presentScene(level1!, transition: SKTransition.fade(withDuration: 0.5))
                
            }
            if clickedNodes.first?.name == "levelButton" {
                let level = GameScene(fileNamed: "GameScene")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
        }
    }
    func changetoPink(circle_shape: SKSpriteNode)
    {
        circle_shape.texture = SKTexture(imageNamed: "happyface")
        circle_shape.physicsBody?.collisionBitMask = goodCategory

        print("Hi")
    }
    func disappearText(stuff1: SKLabelNode, stuff2: SKLabelNode, arrow: SKSpriteNode ) {
        let text = [stuff1, stuff2, arrow]
        for item in text {
            item.alpha = 0
            
        }
    }
    func newText(stuff1: SKLabelNode, stuff2: SKLabelNode, arrow: SKSpriteNode ) {
        let text = [stuff1, stuff2, arrow]
        for item in text {
        item.alpha = 1
        
        }
    }
    
    func stopGame(shape1: SKSpriteNode, shape2: SKSpriteNode) -> Bool{
        shape1.alpha = 0
        shape2.alpha = 0
        shape1.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        shape2.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        //shape1.physicsBody = SKPhysicsBody(circleOfRadius: 1)
       // shape2.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 00,height: 00))
        return true
    }
    /*func normalixevectorx(x: CGFloat, y: CGFloat) -> CGFloat
    {
        var multiplier = sqrt((x*x)+(y*y))
        multiplier = 1/multiplier
        var xvec = multiplier*x
        xvec = xvec * 400
        
        return xvec;
    }
    
    func normalixevectory(x: CGFloat, y: CGFloat) -> CGFloat
    {
        var multiplier = sqrt((x*x)+(y*y))
        multiplier = 1/multiplier
        var yvec = multiplier*y
        yvec = yvec * 400
        
        return yvec;
    }
    override func update(_ currentTime: TimeInterval)
    {
        //Float((circ_made1.physicsBody?.velocity.dx)!)
        let hold1 = sqrt(((circ_made1.physicsBody?.velocity.dx)!*(circ_made1.physicsBody?.velocity.dx)!) + ((circ_made1.physicsBody?.velocity.dy)! * (circ_made1.physicsBody?.velocity.dy)!))
        if hold1 < 300
        {
            circ_made1.physicsBody?.velocity.dx = normalixevectorx(x: (circ_made1.physicsBody?.velocity.dx)!, y: (circ_made1.physicsBody?.velocity.dy)!)
            print("circle x")
            circ_made1.physicsBody?.velocity.dy = normalixevectory(x: (circ_made1.physicsBody?.velocity.dx)!, y: (circ_made1.physicsBody?.velocity.dy)!)
        }
        
        
        let hold3 = sqrt(((square_made1.physicsBody?.velocity.dx)!*(square_made1.physicsBody?.velocity.dx)!) + ((square_made1.physicsBody?.velocity.dy)! * (square_made1.physicsBody?.velocity.dy)!))
        
        if hold3 < 300
        {
            square_made1.physicsBody?.velocity.dx = normalixevectorx(x: (square_made1.physicsBody?.velocity.dx)!, y: (square_made1.physicsBody?.velocity.dy)!)
            
            square_made1.physicsBody?.velocity.dy = normalixevectory(x: (square_made1.physicsBody?.velocity.dx)!, y: (square_made1.physicsBody?.velocity.dy)!)
            
            print("square y")
        }
        
    }*/

    
    
}
