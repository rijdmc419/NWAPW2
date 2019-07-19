//
//  circleChange.swift
//  Game
//
//  Created by Rij Dorfman on 7/19/19.
//  Copyright © 2019 Rij Dorfman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class Shape {
    let shape_texture: SKSpriteNode
    
    init(shape_texture: SKSpriteNode) {
        
        self.shape_texture = shape_texture
    }
}


class Circle: Shape{
    let isPink: Bool
    
    init(shape_texture: SKSpriteNode, isPink: Bool = false) {
        self.isPink = isPink
        // 4
        super.init(shape_texture: shape_texture)
    }
    
}

class circleChange: SKScene {
    
    var isPink = false
    var circ_made: SKSpriteNode!
    //var sprite_array: [SKSpriteNode] = []
    var arraySprites :[SKSpriteNode] = [SKSpriteNode]()
    //let circ_made = SKSpriteNode(imageNamed: "Circle_White")
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        //circle1 = self.childNode(withName: "circle1") as? SKSpriteNode
        
        //let circ_made = SKSpriteNode(imageNamed: "Circle_White")
       // background = self.childNode(withName: "background") as? SKSpriteNode
        //circ_made = self.childNode(withName: "Circle_White") as? SKSpriteNode
        circ_made = SKSpriteNode(imageNamed: "Circle_White")
        circ_made.size = CGSize (width: 200, height: 200)
        circ_made.position = CGPoint (x: 0, y: 200)
        circ_made.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        self.addChild(circ_made)
        
        //arraySprites.append(circ)
        
       let circ1 = Circle(shape_texture: circ_made, isPink: false)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "circ_made" {
                changetoPink()
            }
        }
        /*
        let gameScene = GameScene(fileNamed: "GameScene")
        gameScene?.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: SKTransition.fade(withDuration: 0.5))
         */
    }
    
    func changetoPink() {
        if isPink==false{
            circ_made.texture = SKTexture( imageNamed: "Circle_Pink")
            isPink = true
        }
    }
}





