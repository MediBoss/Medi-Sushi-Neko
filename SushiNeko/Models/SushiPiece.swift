//
//  SushiPiece.swift
//  SushiNeko
//
//  Created by Medi Assumani on 10/4/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import SpriteKit

class SushiPiece: SKSpriteNode{
    
    var rightChopstick: SKSpriteNode!
    var leftChopstick: SKSpriteNode!
    
    var side: Side = .none{
        
        didSet{
            
            switch side {
                
            case .left:
                
                leftChopstick.isHidden = false
                
            case .right:
                
                rightChopstick.isHidden = false
                
            case .none:
                leftChopstick.isHidden = true
                rightChopstick.isHidden = true
            }
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func connectChopsticks() {
        rightChopstick = childNode(withName: "rightChopstick") as? SKSpriteNode
        leftChopstick = childNode(withName: "leftChopstick") as? SKSpriteNode
        side = .none
    }
}
