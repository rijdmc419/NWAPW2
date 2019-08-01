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
    var start: SKSpriteNode!
    var TutorialScenenButton: SKSpriteNode!
    var background: SKSpriteNode!
    var credits: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.yellow
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//Title") as? SKLabelNode
        
        label?.fontSize = 63
        
        background = self.childNode(withName: "background") as? SKSpriteNode
        credits = self.childNode(withName: "credits") as? SKSpriteNode
        start = self.childNode(withName: "start") as? SKSpriteNode
        TutorialScenenButton = self.childNode(withName: "TutorialScenenButton") as? SKSpriteNode
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "start" {
                /*let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let page2 = mainStoryboard.instantiateViewController(withIdentifier: "next") //as! Page2
                //self.present(page2, animated: true)
                self.view!.window?.rootViewController?.present(page2, animated: true, completion: nil)*/
                    
                let level = LevelScreen(fileNamed: "LevelScreen")
                    level?.scaleMode = .aspectFill
                    self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            } 
            
            if nodesArray.first?.name == "TutorialScenenButton" {
                
                let level = TutorialScene(fileNamed: "TutorialScene")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "credits" {
                
                let level = Credits(fileNamed: "Credits")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
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
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
