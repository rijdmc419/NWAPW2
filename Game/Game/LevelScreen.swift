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
    var reset_defaults: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        background = SKSpriteNode(imageNamed: "Pad_Background")
        background?.size = CGSize (width: 750, height: 1334)
        self.addChild(background)
        background.zPosition = -1
        
        reset_defaults = SKSpriteNode(imageNamed: "reset")
        reset_defaults.name = "reset"
        reset_defaults.alpha = 1
        reset_defaults.size = CGSize (width: 150, height: 80)
        reset_defaults.position = CGPoint (x: -200, y: 580)
        reset_defaults.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        reset_defaults.zPosition = 2
        self.addChild(reset_defaults)
        
        self.title = self.childNode(withName: "Title") as? SKLabelNode
        
        if defaults.value(forKey: "Level1Stars") != nil && defaults.value(forKey: "Level1Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_one") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_1_complete")
        }
        if defaults.value(forKey: "Level2Stars") != nil && defaults.value(forKey: "Level2Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_two") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_2_complete")
        }
        if defaults.value(forKey: "Level3Stars") != nil && defaults.value(forKey: "Level3Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_three") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_3_complete")
        }
        if defaults.value(forKey: "Level4Stars") != nil && defaults.value(forKey: "Level4Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_4") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_4_complete")
        }
        if defaults.value(forKey: "Level5Stars") != nil && defaults.value(forKey: "Level5Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_5") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_5_complete")
        }
        
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
            if nodesArray.first?.name == "reset" {
                resetDefaults()
            }
        }
    }
    
        func resetDefaults() {
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
            
            let level = LevelScreen(fileNamed: "LevelScreen")
            level?.scaleMode = .aspectFill
            self.view?.presentScene(level!)
        }
}
