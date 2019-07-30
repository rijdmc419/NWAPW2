//
//  Level1.swift
//  Game
//
//  Created by Rij Dorfman on 7/16/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class Level2: SKScene, SKPhysicsContactDelegate {
    
    
    var arraySprites : [SKSpriteNode]!
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
    var square1 : Square!
    var level_doneButton: SKSpriteNode!
    var restartButton: SKSpriteNode!
    var background: SKSpriteNode!
    var goal: SKNode!

    var timearea : SKNode!
    var timebox: SKSpriteNode!
    var timeLabel: SKLabelNode!
    var timer = Timer()
    var duration = 0.0
    var isTimerOn = false

    var levelName: SKLabelNode!
    
    override func didMove(to view: SKView) {
        background = SKSpriteNode(imageNamed: "Pad_Background")
        background?.size = CGSize (width: 750, height: 1334)
        self.addChild(background)
        background.zPosition = -1
        self.physicsWorld.contactDelegate = self
        
        timearea = SKNode()
        
        timebox = SKSpriteNode(imageNamed: "Timer")
        timebox?.size = CGSize (width: 150, height: 180)
        timebox.position = CGPoint (x: 190, y: 490)
        timearea.addChild(timebox)
        
        timeLabel = SKLabelNode()
        timeLabel.position = CGPoint (x: 190, y: 465)
        timeLabel.fontName = "ChalkDuster"
        timeLabel.fontSize = 40
        timeLabel.fontColor = UIColor.black
        timeLabel.zPosition = 0
        timearea.addChild(timeLabel)
        isTimerOn.toggle()
        toggleTimer(on: isTimerOn, label: timeLabel)
        timearea.position = CGPoint (x: 35, y: 0)
        timearea.alpha = 1
        self.addChild(timearea)
        
        levelName = SKLabelNode ()
        levelName.fontName = "ChalkDuster"
        levelName.fontSize = 40
        levelName.fontColor = UIColor.black
        levelName.zPosition = 0
        levelName.position = CGPoint (x: 0, y: 550)
        levelName.text = "LEVEL 2"
        self.addChild(levelName)

        
        
        level_doneButton = SKSpriteNode(imageNamed: "done_button")
        level_doneButton.name = "levelButton"
        level_doneButton.alpha = 0
        level_doneButton.size = CGSize (width: 120, height: 60)
        level_doneButton.position = CGPoint (x: -200, y: 610)
        level_doneButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        level_doneButton.zPosition = 2
        self.addChild(level_doneButton)
        
        restartButton = SKSpriteNode(imageNamed: "restart_button")
        restartButton.name = "restartButton"
        restartButton.alpha = 1
        restartButton.size = CGSize (width: 60, height: 60)
        restartButton.position = CGPoint (x: 210, y: 610)
        restartButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        restartButton.zPosition = 2
        self.addChild(restartButton)
        
        //bottom boarder
        lineb = SKSpriteNode(imageNamed: "line2")
        lineb.size = CGSize (width: 600, height: 2)
        lineb.position = CGPoint (x: 0, y: -500)
        lineb.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(lineb)
        lineb.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 600, height: 2))
        lineb.physicsBody?.isDynamic = false
        lineb.physicsBody?.friction = 0
        lineb.physicsBody?.restitution = 1
        lineb.physicsBody?.categoryBitMask = goodCategory
        lineb.physicsBody?.collisionBitMask = goodCategory
        lineb.name = "wallb"
        lineb.alpha = 0
        
        //topboarder
        linet = SKSpriteNode(imageNamed: "line2")
        linet.size = CGSize (width: 600, height: 2)
        linet.position = CGPoint (x: 0, y: 400)
        linet.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(linet)
        linet.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 600, height: 2))
        linet.physicsBody?.isDynamic = false
        linet.physicsBody?.friction = 0
        linet.physicsBody?.restitution = 1
        linet.name = "wallt"
        linet.alpha = 0
        linet.physicsBody?.categoryBitMask = goodCategory
        linet.physicsBody?.collisionBitMask = goodCategory
        
        
        
        //rightside baorder
        liner = SKSpriteNode(imageNamed: "line2")
        liner.size = CGSize (width: 2, height: 900)
        liner.position = CGPoint (x: 300, y: -50)
        liner.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        liner.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 2, height: 900))
        liner.physicsBody?.isDynamic = false
        liner.physicsBody?.friction = 0
        liner.physicsBody?.restitution = 1
        liner.physicsBody?.affectedByGravity = false
        liner.alpha = 0
        self.addChild(liner)
        liner.physicsBody?.categoryBitMask = goodCategory
        liner.physicsBody?.collisionBitMask = goodCategory
        liner.name = "wallr"
        
        
        //leftside boarder
        linel = SKSpriteNode(imageNamed: "line2")
        linel.size = CGSize (width: 2, height: 900)
        linel.position = CGPoint (x: -300, y: -50)
        linel.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(linel)
        linel.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 2, height: 800))
        linel.physicsBody?.isDynamic = false
        linel.physicsBody?.friction = 0
        linel.physicsBody?.restitution = 1
        linel.name = "walll"
        linel.alpha = 0
        linel.physicsBody?.categoryBitMask = goodCategory
        linel.physicsBody?.collisionBitMask = goodCategory
        
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
        //goal
        goal = SKNode()
        goal.position = CGPoint (x: 0, y: 480)
        self.addChild(goal)
        let goal_circle = SKSpriteNode(imageNamed: "Circle_Pink")
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
        
        circ_made1 = SKSpriteNode(imageNamed: "Circle_White")
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
        circ_made1.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 100))
        circ1 = Circle(shape_sprite: circ_made1, isPink: false, isCircle: true)
    
        square_made1 = SKSpriteNode(imageNamed: "angryface")
        square_made1.name = "square"
        square_made1.userData = [
            "isCircle" : false
        ];
        square_made1.size = CGSize (width: 100, height: 100)
        square_made1.position = CGPoint (x: -200, y: -350)
        square_made1.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(square_made1)
        square_made1.physicsBody = SKPhysicsBody(rectangleOf:  CGSize (width: 100, height: 100))
        square_made1.physicsBody?.isDynamic = true
        square_made1.physicsBody?.affectedByGravity = false
        square_made1.physicsBody?.allowsRotation = false
        square_made1.physicsBody?.linearDamping = 0.0
        square_made1.physicsBody?.angularDamping = 0.0
        square_made1.physicsBody?.restitution = 0
        square_made1.physicsBody?.friction = 1
        square_made1.physicsBody?.mass = 1
        square_made1.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        square_made1.physicsBody?.categoryBitMask = goodCategory
        square_made1.physicsBody?.collisionBitMask = goodCategory
        square_made1.physicsBody?.contactTestBitMask = goodCategory

        arrayCircles = [circ1]
        arraySprites = [circ_made1,square_made1]
        
        for item in arrayCircles
        {
            
            item.shape_sprite.userData = [
                "isPink" : false,
                "isCircle" : true
            ];
            
            item.shape_sprite.physicsBody?.collisionBitMask = goodCategory
            item.shape_sprite.physicsBody?.categoryBitMask = goodCategory
            item.shape_sprite.physicsBody?.mass = 0.2
        }
    }
    func didBegin(_ contact: SKPhysicsContact)
    {
        let firstBody = contact.bodyA.node as! SKSpriteNode
        let secondBody = contact.bodyB.node as! SKSpriteNode

        
        
        if ((firstBody.name == "square") && (secondBody.name == "circle"))
        {
            collisions(circle: secondBody, square: firstBody)
            
        }
        else if ((firstBody.name == "circle") && (secondBody.name == "square"))
        {
            collisions(circle: firstBody, square: secondBody)
            
        }
            //rightwall
        else if ((firstBody.name == "square") && (secondBody.name == "wallr"))
        {
            firstBody.physicsBody?.applyImpulse(CGVector(dx:-10, dy: 0))
        }
        else if ((firstBody.name == "wallr") && (secondBody.name == "square"))
        {
            secondBody.physicsBody?.applyImpulse(CGVector(dx:-10, dy: 0))
        }
            //leftwall
        else if ((firstBody.name == "square") && (secondBody.name == "walll"))
        {
            print("LeftWAll")

            firstBody.physicsBody?.applyImpulse(CGVector(dx:10, dy: 0))
        }
        else if ((firstBody.name == "walll") && (secondBody.name == "square"))
        {
            print("LeftWAll")

            secondBody.physicsBody?.applyImpulse(CGVector(dx:10, dy: 0))
        }
            //bottom wall
        else if ((firstBody.name == "square") && (secondBody.name == "wallb"))
        {
            firstBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: 10))
        }
        else if ((firstBody.name == "wallb") && (secondBody.name == "square"))
        {
            secondBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: 10))
        }
            //top wall
        else if ((firstBody.name == "square") && (secondBody.name == "wallt"))
        {
            firstBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: -10))
        }
        else if ((firstBody.name == "wallt") && (secondBody.name == "square"))
        {
            secondBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: -10))
        }
            //rightwall
        else if ((firstBody.name == "circle") && (secondBody.name == "wallr"))
        {
            firstBody.physicsBody?.applyImpulse(CGVector(dx:-10, dy: 0))
        }
        else if ((firstBody.name == "wallr") && (secondBody.name == "circle"))
        {
            secondBody.physicsBody?.applyImpulse(CGVector(dx:-10, dy: 0))
        }
            //leftwall
        else if ((firstBody.name == "circle") && (secondBody.name == "walll"))
        {
            print("LeftWAll")

            firstBody.physicsBody?.applyImpulse(CGVector(dx:10, dy: 0))
        }
        else if ((firstBody.name == "walll") && (secondBody.name == "circle"))
        {
            print("LeftWAll")

            secondBody.physicsBody?.applyImpulse(CGVector(dx:10, dy: 0))
        }
            //bottom wall
        else if ((firstBody.name == "circle") && (secondBody.name == "wallb"))
        {
            firstBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: 10))
        }
        else if ((firstBody.name == "wallb") && (secondBody.name == "circle"))
        {
            secondBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: 10))
        }
            //top wall
        else if ((firstBody.name == "circle") && (secondBody.name == "wallt"))
        {
            firstBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: -10))
        }
        else if ((firstBody.name == "wallt") && (secondBody.name == "circle"))
        {
            secondBody.physicsBody?.applyImpulse(CGVector(dx:0, dy: -10))
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
                //print(velocityx)
                let velocityy = circle.physicsBody?.velocity.dy
                circle.physicsBody = SKPhysicsBody(circleOfRadius: 50)
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
                circle.physicsBody?.categoryBitMask = goodCategory
                circle.physicsBody?.collisionBitMask = goodCategory
                
                circle.name = "square"
            }
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
            
            if clickedNodes.first?.userData?.value(forKey: "isCircle") as? Bool == false
            {
                clickedNodes.first?.alpha = 0
                clickedNodes.first?.physicsBody = SKPhysicsBody(rectangleOf: CGSize (width: 00,height: 00))
                
            }
            
            if clickedNodes.first?.name == "restartButton"
            {
                
                let level2 = Level2(fileNamed: "Level2")
                level2?.scaleMode = .aspectFill
                self.view?.presentScene(level2!, transition: SKTransition.fade(withDuration: 0.5))
                
            }
            var numPinkCirc = 0
            for item in arrayCircles
            {
                
                if item.shape_sprite.userData?.value(forKey: "isCircle") as? Bool == true {
                    
                    if item.shape_sprite.userData?.value(forKey: "isPink") as? Bool == true {
                        
                        numPinkCirc = numPinkCirc+1
                        if numPinkCirc >= 1 {
                            // open level completed scene, or reveal next level button
                            isTimerOn = false
                            toggleTimer(on: isTimerOn, label: timeLabel)
                            
                            print("you win!")
                            level_doneButton.alpha = 1
                            if clickedNodes.first?.name == "levelButton" {
                                let level = Level3(fileNamed: "Level3")
                                level?.scaleMode = .aspectFill
                                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))

                            }
                        }
                    }
                }
            }
        }
    }
    func changetoPink(circle_shape: SKSpriteNode)
    {
        circle_shape.texture = SKTexture(imageNamed: "Circle_Pink")
        print("Hi")
    }
    
    func normalixevectorx(x: CGFloat, y: CGFloat) -> CGFloat
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
        for item in arraySprites
        {
            if item.alpha == CGFloat(1)
            {
                let hold3 = sqrt(((item.physicsBody?.velocity.dx)!*(item.physicsBody?.velocity.dx)!) + ((item.physicsBody?.velocity.dy)! * (item.physicsBody?.velocity.dy)!))
                
                if hold3 < 300 || hold3 > 400
                {
                    item.physicsBody?.velocity.dx = normalixevectorx(x: (item.physicsBody?.velocity.dx)!, y: (item.physicsBody?.velocity.dy)!)
                    
                    item.physicsBody?.velocity.dy = normalixevectory(x: (item.physicsBody?.velocity.dx)!, y: (item.physicsBody?.velocity.dy)!)
                    
                }
            }
        }
        
    }
    func toggleTimer(on: Bool, label: SKLabelNode) {
        if on == true {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] (_) in
                self.duration += 0.1
                self.duration = self.duration * 10
                self.duration = round(self.duration)
                self.duration = self.duration / 10
                label.text = String(self.duration)
                //print("gogogogogogogogogogogog")
            })
        }
        else{
            timer.invalidate()
        }
        
    }
}

