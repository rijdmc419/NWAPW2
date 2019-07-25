//
//  GameScene.swift
//  Game
//
//  Created by Rij Dorfman on 7/15/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var label : SKLabelNode?
    var spinnyNode : SKShapeNode?
    var nextScenenButton: SKSpriteNode!
    var background: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.yellow
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//Title") as? SKLabelNode
        
        label?.fontSize = 63
        
        background = self.childNode(withName: "background") as? SKSpriteNode
        nextScenenButton = self.childNode(withName: "nextScenenButton") as? SKSpriteNode
        
        /*
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
         
         }
        */
 
        
    }
    
    /*
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "nextScenenButton" {
                /*let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let page2 = mainStoryboard.instantiateViewController(withIdentifier: "next") //as! Page2
                //self.present(page2, animated: true)
                self.view!.window?.rootViewController?.present(page2, animated: true, completion: nil)*/
                    
                    let level5 = Level5(fileNamed: "Level5")
                    level5?.scaleMode = .aspectFill
                    self.view?.presentScene(level5!, transition: SKTransition.fade(withDuration: 0.5))
            }
        }
        
        
        
        /*
         let level1 = Level1(fileNamed: "Level1")
         level1?.scaleMode = .aspectFill
         self.view?.presentScene(level1!, transition: SKTransition.fade(withDuration: 0.5))
         */
        
      /*
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        */
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
