//
//  LevelScreen.swift
//  Game
//
//  Created by Rij Dorfman on 7/29/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class LevelScreen: SKScene {
    
    var background : SKSpriteNode!
    var title : SKLabelNode!
    
    override func didMove(to view: SKView) {
        background = SKSpriteNode(imageNamed: "Pad_Background")
        background?.size = CGSize (width: 750, height: 1334)
        self.addChild(background)
        background.zPosition = -1
        
        self.title = self.childNode(withName: "Title") as? SKLabelNode
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
             if nodesArray.first?.name == "main_menu" {
                let level = GameScene(fileNamed: "GameScene")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_one" {
                let level = Level1(fileNamed: "Level1")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_two" {
                let level = Level2(fileNamed: "Level2")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_three" {
                let level = Level3(fileNamed: "Level3")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_4" {
                let level = Level4(fileNamed: "Level4")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_5" {
                let level = Level5(fileNamed: "Level5")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
        }
    }
    
}
