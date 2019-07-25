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


class Shape {
    let shape_sprite: SKSpriteNode
    
    init(shape_sprite: SKSpriteNode) {
        
        self.shape_sprite = shape_sprite
    }
    
}

class Circle: Shape{
    var isPink: Bool
    var isCircle: Bool
    init(shape_sprite: SKSpriteNode, isPink: Bool = false, isCircle: Bool = true) {
        self.isPink = isPink
        self.isCircle = isCircle
        super.init(shape_sprite: shape_sprite)
    }
}

class Square: Shape{
    //var isThere: Bool
    
    override init(shape_sprite: SKSpriteNode /*, isPink: Bool = false*/) {
        //self.isThere = isThere
        super.init(shape_sprite: shape_sprite)
    }
}
class Level2: SKScene, SKPhysicsContactDelegate {
    
    
    var arraySprites : [Shape]!
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
}
