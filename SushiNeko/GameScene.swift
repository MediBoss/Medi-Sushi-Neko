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
        addRandomSushiPieces(total: 5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self)
        if location.x > size.width / 2 {
            feline.side = .right
        }else{
            feline.side = .left
        }
        
        if let firstPiece = sushiTower.first as SushiPiece? {
            sushiTower.removeFirst()
            firstPiece.flip(side: feline.side)
            addRandomSushiPieces(total: 1)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveTowerDown()
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
    
    /// Method to add a set number of pieces randomly on the tower
    func addRandomSushiPieces(total: Int){
        
        for _ in 1...total{
            let lastPiece = sushiTower.last!
            if lastPiece.side != .none {
                addTowerPiece(side: .none)
            } else {
                let randomNumber = arc4random_uniform(100)
                if randomNumber < 45 {
                    addTowerPiece(side: .left)
                } else if randomNumber < 90 {
                    addTowerPiece(side: .right)
                } else {
                    addTowerPiece(side: .none)
                }
            }
        }
    }
    
    /// Method to move down the tower each time a piece is removed
    func moveTowerDown(){
        var n: CGFloat = 0
        
        sushiTower.forEach { (piece) in
            let y = (n * 55) + 215
            piece.position.y -= (piece.position.y - y) * 0.5
            n += 1
        }
    }
    
    
}
