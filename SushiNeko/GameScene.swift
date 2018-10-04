//
//  GameScene.swift
//  SushiNeko
//
//  Created by Medi Assumani on 10/4/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var sushiTower: [SushiPiece] = []
    var sushiBasePiece: SushiPiece!
    var feline: Character!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        sushiBasePiece = childNode(withName: "sushiBasePiece") as? SushiPiece
        feline = childNode(withName: "feline") as? Character
        
        sushiBasePiece.connectChopsticks()
        
        addTowerPiece(side: .none)
    }
    
    
    /// Method to add a piece of sushi in the tower
    func addTowerPiece(side: Side) {
        
        // Getting the positions of the last piece
        let newPiece = sushiBasePiece.copy() as! SushiPiece
        let lastPiece = sushiTower.last
        let lastPosition = lastPiece?.position ?? sushiBasePiece.position
        let lastZPosition = lastPiece?.zPosition ?? sushiBasePiece.zPosition
        
        // Setting up the new piece positions based on the last piece
        newPiece.connectChopsticks()
        newPiece.position.x = lastPosition.x
        newPiece.position.y = lastPosition.y + 55
        newPiece.zPosition = lastZPosition + 1
        newPiece.side = side
        
        // Adding new sushi to the scene and array
        addChild(newPiece)
        sushiTower.append(newPiece)
    }
}
