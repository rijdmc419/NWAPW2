//
//  Level1.swift
//  Game
//
//  Created by Rij Dorfman on 7/16/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import Foundation
import SpriteKit

class Level1: SKScene {
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.orange
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = GameScene(fileNamed: "GameScene")
        gameScene?.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: SKTransition.fade(withDuration: 0.5))
    }

}
