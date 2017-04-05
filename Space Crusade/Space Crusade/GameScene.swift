//
//  GameScene.swift
//  Space Crusade
//
//  Created by Ahmad on 3/23/17.
//  Copyright © 2017 Ahmad El-baba. All rights reserved.
//


// Comment Area

import SpriteKit

class GameScene: SKScene {
    var sceneNumber = 0
    let worldSelectBox = SKSpriteNode(color:UIColor.blue, size: CGSize(width:150,height:150))
    let optionsBox = SKSpriteNode(color:UIColor.green, size: CGSize(width:150,height:150))
    let shipBox = SKSpriteNode(color:UIColor.yellow, size: CGSize(width:150,height:150))
    override func didMove(to view: SKView) {
        let backround = SKSpriteNode(color:UIColor.red, size: CGSize(width:1080,height:1920))
        backround.position = CGPoint(x: 540,y:960)
        backround.blendMode = .replace
        backround.zPosition = -1
        backround.name = "Backround"
        addChild(backround)
       
        worldSelectBox.position = CGPoint(x: 540,y:960)
        worldSelectBox.blendMode = .replace
        worldSelectBox.zPosition = -1
        worldSelectBox.name = "World Select"
        addChild(worldSelectBox)
        
        optionsBox.position = CGPoint(x: 900,y:960)
        optionsBox.blendMode = .replace
        optionsBox.zPosition = 0
          optionsBox.name = "Options"
        addChild(optionsBox)
        
        shipBox.position = CGPoint(x: 180,y:960)
        shipBox.blendMode = .replace
        shipBox.zPosition = 0
          shipBox.name = "ShipBox"
        addChild(shipBox)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
          
            
            switch touchedNode.name! {
            case "World Select":
             let transition = SKTransition.moveIn(with: .up, duration: 1.0)
                  let nextScene = WorldSelectScene(size: scene!.size)
             nextScene.scaleMode = .aspectFill
                scene?.view?.presentScene(nextScene, transition: transition)
                
          case "Options":
           let transition = SKTransition.reveal(with: .right, duration: 1.0)
            let nextScene = UpgradeScene(size: scene!.size)
            nextScene.scaleMode = .aspectFill
            scene?.view?.presentScene(nextScene, transition: transition)
                
            case "ShipBox":
             let transition = SKTransition.reveal(with: .left, duration: 1.0)
            let nextScene = Options(size: scene!.size)
            nextScene.scaleMode = .aspectFill
            scene?.view?.presentScene(nextScene, transition: transition)
                
            default:

                return
            }
           
        
            
            
            
            
        }
    }
    
}
