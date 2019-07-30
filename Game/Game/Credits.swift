//
//  Credits.swift
//  Game
//
//  Created by Rij Dorfman on 7/30/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit



class Credits: SKScene {
    
    var background : SKSpriteNode!
    var credit_text1: SKSpriteNode!
    var done_button: SKSpriteNode!
    
    override func didMove(to view: SKView) {
    
        background = SKSpriteNode(imageNamed: "Pad_Background")
        background?.size = CGSize (width: 750, height: 1334)
        self.addChild(background)
        background.zPosition = -1
        
        credit_text1 = self.childNode(withName: "credit_text") as? SKSpriteNode
        credit_text1.zPosition = 0
        
        done_button = SKSpriteNode(imageNamed: "main_menu")
        done_button.name = "main_menu"
        done_button.alpha = 1
        done_button.size = CGSize (width: 220, height: 80)
        done_button.position = CGPoint (x: -210, y: 580)
        done_button.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        done_button.zPosition = 2
        self.addChild(done_button)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let clickedNodes = self.nodes(at: location)
            
            print("part1")
            
            if clickedNodes.first?.name == "main_menu"{
                
                let level = GameScene(fileNamed: "GameScene")
                level?.scaleMode = .aspectFill
                self.view?.presentScene(level!, transition: SKTransition.fade(withDuration: 0.5))
            }
        }
        
        
    }

}
