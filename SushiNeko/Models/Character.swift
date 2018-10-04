//
//  Character.swift
//  SushiNeko
//
//  Created by Medi Assumani on 10/4/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import SpriteKit

class Character: SKSpriteNode{
    
    let punch = SKAction.animate(with: [SKTexture(imageNamed: "character2.png"), SKTexture(imageNamed: "character3.png")], timePerFrame: 0.07, resize: false, restore: true)
    var side: Side = .left{
        didSet{
            if side == .left {
                xScale = 1
                position.x = 70
            } else {
                xScale = -1
                position.x = 252
            }
            run(punch)
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
