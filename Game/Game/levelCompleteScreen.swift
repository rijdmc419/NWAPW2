//
//  levelCompleteScreen.swift
//  Game
//
//  Created by Chloe Unflat on 7/31/19.
//  Copyright © 2019 Chloe Unflat. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class levelCompleteScreen: SKScene {
    var starEraserButton: SKSpriteNode!
    var LevelScreenButton: SKSpriteNode!
    var restartLevelButton: SKSpriteNode!
    var nextButton: SKSpriteNode!
    var completeScreen: SKNode!
    var tintBar: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //self.backgroundColor = SKColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        self.backgroundColor = SKColor.lightGray

        starEraserButton = SKSpriteNode(imageNamed: "white_square")
        starEraserButton.name = "starEraserButton"
        starEraserButton.alpha = 1
        starEraserButton.size = CGSize (width: 60, height: 60)
        starEraserButton.position = CGPoint (x: -100, y: 0)
        starEraserButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        starEraserButton.zPosition = 4
        
        LevelScreenButton = SKSpriteNode(imageNamed: "LevelSelectButtonCircle")
        LevelScreenButton.name = "LevelScreenButton"
        LevelScreenButton.alpha = 1
        LevelScreenButton.size = CGSize (width: 60, height: 60)
        LevelScreenButton.position = CGPoint (x: -100, y: 0)
        LevelScreenButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        LevelScreenButton.zPosition = 4
        
        restartLevelButton = SKSpriteNode(imageNamed: "ScoringRestartCircle")
        restartLevelButton.name = "restartLevelButton"
        restartLevelButton.alpha = 1
        restartLevelButton.size = CGSize (width: 60, height: 60)
        restartLevelButton.position = CGPoint (x: 0, y: 0)
        restartLevelButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        restartLevelButton.zPosition = 4
        
        nextButton = SKSpriteNode(imageNamed: "NextLevelCircle")
        nextButton.name = "nextButton"
        nextButton.alpha = 1
        nextButton.size = CGSize (width: 60, height: 60)
        nextButton.position = CGPoint (x: 100, y: 0)
        nextButton.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        nextButton.zPosition = 4
        
        tintBar = SKSpriteNode()
        tintBar.name = "tintBar"
        tintBar.color = .purple
        tintBar.alpha = 0.5
        tintBar.size = CGSize (width: 400, height: 2000)
        tintBar.position = CGPoint (x: 0, y: 0)
        tintBar.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        tintBar.zPosition = 3
        
        completeScreen = SKNode()
        completeScreen.alpha = 1
        self.addChild(completeScreen)
        completeScreen.addChild(tintBar)
        completeScreen.addChild(LevelScreenButton)
        completeScreen.addChild(restartLevelButton)
        completeScreen.addChild(nextButton)

        //do i need this?
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1.0
        self.physicsBody = boarder
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self)
        {
            let clickedNodes = self.nodes(at: location)
            
            print("screenTouched")
            
            if clickedNodes.first?.name == "restartLevelButton"
            {
                //change to specific level
                let circlechange = circleChange(fileNamed: "circleChange")
                circlechange?.scaleMode = .aspectFill
                self.view?.presentScene(circlechange!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if clickedNodes.first?.name == "LevelScreenButton"
            {
                let circlechange = LevelScreen(fileNamed: "LevelScreen")
                circlechange?.scaleMode = .aspectFill
                self.view?.presentScene(circlechange!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
            if clickedNodes.first?.name == "nextButton"
            {
                //change to  next level
                let circlechange = LevelScreen(fileNamed: "LevelScreen")
                circlechange?.scaleMode = .aspectFill
                self.view?.presentScene(circlechange!, transition: SKTransition.fade(withDuration: 0.5))
            }
            
           // if clickedNodes.first?.name == "tintBar" {
                
              //  completeScreen.alpha = 0
              //  scene?.physicsWorld.speed = 1
           // }
        }
        
    }
  
    
    
}







