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
        
        if defaults.value(forKey: "OpenfirstTime") == nil{
            defaults.set(true, forKey: "OpenfirstTime")
            print ("openfirst")
        }
        
        else if defaults.value(forKey: "OpenfirstTime") as! Bool == true {
            defaults.set(0, forKey: "Level1Stars")
            defaults.set(0, forKey: "Level2Stars")
            defaults.set(0, forKey: "Level3Stars")
            defaults.set(0, forKey: "Level4Stars")
            defaults.set(0, forKey: "Level5Stars")
            defaults.set(0, forKey: "Level6Stars")
            defaults.set(0, forKey: "Level7Stars")
            defaults.set(0, forKey: "Level8Stars")
            defaults.set(0, forKey: "Level9Stars")
            defaults.set(false, forKey: "OpenfirstTime")
            print ("already open")
        }
        
        
        
        if defaults.value(forKey: "Level1Stars") != nil && defaults.value(forKey: "Level1Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_one") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_1_complete")
            let level2 = self.childNode(withName: "level_two") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_two")
            if defaults.value(forKey: "Level1Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level1Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level1Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level2Stars") != nil && defaults.value(forKey: "Level2Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_two") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_2_complete")
            let level2 = self.childNode(withName: "level_three") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_three")
            if defaults.value(forKey: "Level2Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level2Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level2Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level3Stars") != nil && defaults.value(forKey: "Level3Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_three") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_3_complete")
            let level2 = self.childNode(withName: "level_4") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_4")
            if defaults.value(forKey: "Level3Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level3Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level3Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level4Stars") != nil && defaults.value(forKey: "Level4Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_4") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_4_complete")
            let level2 = self.childNode(withName: "level_5") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_5")
            if defaults.value(forKey: "Level4Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level4Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level4Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level5Stars") != nil && defaults.value(forKey: "Level5Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_5") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_5_complete")
            let level2 = self.childNode(withName: "level_6") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_6")
            if defaults.value(forKey: "Level5Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level5Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level5Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level6Stars") != nil && defaults.value(forKey: "Level6Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_6") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_6_complete")
            let level2 = self.childNode(withName: "level_7") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_7")
            if defaults.value(forKey: "Level6Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level6Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level6Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level7Stars") != nil && defaults.value(forKey: "Level7Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_7") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_7_complete")
            let level2 = self.childNode(withName: "level_8") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_8")
            if defaults.value(forKey: "Level7Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level7Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level7Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level8Stars") != nil && defaults.value(forKey: "Level8Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_8") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_8_complete")
            let level2 = self.childNode(withName: "level_9") as? SKSpriteNode
            level2?.texture = SKTexture(imageNamed: "level_9")
            if defaults.value(forKey: "Level8Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level8Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level8Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
        }
        if defaults.value(forKey: "Level9Stars") != nil && defaults.value(forKey: "Level9Stars") as! Int >= 1 {
            print("pink!")
            let level1 = self.childNode(withName: "level_9") as? SKSpriteNode
            level1?.texture = SKTexture(imageNamed: "level_9_complete")
            if defaults.value(forKey: "Level9Stars") as! Int == 1 {
                let stars = SKSpriteNode(imageNamed: "1_star")
                stars.size = CGSize (width: 20, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level9Stars") as! Int == 2 {
                let stars = SKSpriteNode(imageNamed: "2_star")
                stars.size = CGSize (width: 40, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            else if defaults.value(forKey: "Level9Stars") as! Int == 3 {
                let stars = SKSpriteNode(imageNamed: "3_star")
                stars.size = CGSize (width: 60, height: 20)
                stars.position = CGPoint (x: 0, y: -55)
                stars.anchorPoint = CGPoint (x: 0.5, y: 0.5)
                stars.zPosition = 2
                level1?.addChild(stars)
            }
            
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
            
            if nodesArray.first?.name == "level_two" && (defaults.value(forKey: "Level1Stars") as! Int >= 1) {
                let level = Level2(fileNamed: "Level2")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_three" && defaults.value(forKey: "Level2Stars") as! Int >= 1 {
                let level = Level3(fileNamed: "Level3")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_4" && defaults.value(forKey: "Level3Stars") as! Int >= 1{
                let level = Level4(fileNamed: "Level4")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if nodesArray.first?.name == "level_5" && defaults.value(forKey: "Level4Stars") as! Int >= 1 {
                let level = Level5(fileNamed: "Level5")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            if nodesArray.first?.name == "level_6" && defaults.value(forKey: "Level5Stars") as! Int >= 1  {
                let level = Level6(fileNamed: "Level6")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            if nodesArray.first?.name == "level_7" && defaults.value(forKey: "Level6Stars") as! Int >= 1  {
                let level = Level7(fileNamed: "Level7")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            /*
            if nodesArray.first?.name == "level_8" && defaults.value(forKey: "Level7Stars") as! Int >= 1  {
                let level = Level8(fileNamed: "Level8")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            if nodesArray.first?.name == "level_9" && defaults.value(forKey: "Level8Stars") as! Int >= 1 {
                let level = Level9(fileNamed: "Level9")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
            */
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
            
            if defaults.value(forKey: "OpenfirstTime") == nil{
                defaults.set(true, forKey: "OpenfirstTime")
                print ("openfirst")
            }
                
            else if defaults.value(forKey: "OpenfirstTime") as! Bool == true {
                defaults.set(0, forKey: "Level1Stars")
                defaults.set(0, forKey: "Level2Stars")
                defaults.set(0, forKey: "Level3Stars")
                defaults.set(0, forKey: "Level4Stars")
                defaults.set(0, forKey: "Level5Stars")
                defaults.set(0, forKey: "Level6Stars")
                defaults.set(0, forKey: "Level7Stars")
                defaults.set(0, forKey: "Level8Stars")
                defaults.set(0, forKey: "Level9Stars")
                defaults.set(false, forKey: "OpenfirstTime")
                print ("already open")
            }
            
            let level = LevelScreen(fileNamed: "LevelScreen")
            level?.scaleMode = .aspectFill
            self.view?.presentScene(level!)
            print("Reset")
        }
}
