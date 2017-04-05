//
//  WorldSelectScene.swift
//  Space Crusade
//
//  Created by Ahmad on 3/27/17.
//  Copyright © 2017 Ahmad El-baba. All rights reserved.
//

import SpriteKit

class WorldSelectScene: SKScene {

    
    
    let level1_1 = SKSpriteNode(color:UIColor.blue, size: CGSize(width:150,height:150))
    let level1_2 = SKSpriteNode(color:UIColor.green, size: CGSize(width:150,height:150))
    let level1_3 = SKSpriteNode(color:UIColor.yellow, size: CGSize(width:150,height:150))
    let level1_4 = SKSpriteNode(color:UIColor.red, size: CGSize(width:150,height:150))
    let level1_5 = SKSpriteNode(color:UIColor.black, size: CGSize(width:150,height:150))
    let level1_boss = SKSpriteNode(color:UIColor.darkGray, size: CGSize(width:150,height:150))
    let rightArrow = SKSpriteNode(color:UIColor.lightGray, size: CGSize(width:150,height:150))
    
    
    override func didMove(to view: SKView) {
        let backround = SKSpriteNode(color:UIColor.purple, size: CGSize(width:1080,height:1920))
        backround.position = CGPoint(x: 540,y:320)
        backround.blendMode = .replace
        backround.zPosition = -1
        addChild(backround)
        
        level1_1.position = CGPoint(x: 540,y:240)
        level1_1.blendMode = .replace
        level1_1.zPosition = 0
        level1_1.name = "1_1"
        addChild(level1_1)
        
        level1_2.position = CGPoint(x: 540,y:480)
        level1_2.blendMode = .replace
        level1_2.zPosition = 0
        level1_2.name = "1_2"
        addChild(level1_2)
        
        level1_3.position = CGPoint(x: 540,y:720)
        level1_3.blendMode = .replace
        level1_3.zPosition = 0
        level1_3.name = "1_3"
        addChild(level1_3)
        
        level1_4.position = CGPoint(x: 540,y:960)
        level1_4.blendMode = .replace
        level1_4.zPosition = 0
        level1_4.name = "1_4"
        addChild(level1_4)
        
        level1_5.position = CGPoint(x: 540,y:1200)
        level1_5.blendMode = .replace
        level1_5.zPosition = 0
        level1_5.name = "1_5"
        addChild(level1_5)
        
        level1_boss.position = CGPoint(x: 540,y:1440)
        level1_boss.blendMode = .replace
        level1_boss.zPosition = 0
        level1_boss.name = "boss1"
        addChild(level1_boss)
        
        rightArrow.position = CGPoint(x: 900,y:1800)
        rightArrow.blendMode = .replace
        rightArrow.zPosition = 0
        rightArrow.name = "nextLevel"
        addChild(rightArrow)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "nextLevel"{
                let transition = SKTransition.moveIn(with: .right, duration: 1.0)
                let nextScene = WorldSelectScene(size: scene!.size)
                nextScene.scaleMode = .aspectFill
                scene?.view?.presentScene(nextScene, transition: transition)
            }
            
            if touchedNode.name == "1_1"{
                let transition = SKTransition.moveIn(with: .right, duration: 1.0)
                let nextScene = Level1_1(size: scene!.size)
                nextScene.scaleMode = .aspectFill
                scene?.view?.presentScene(nextScene, transition: transition)
            }
            
      
        }
        
    }
   
    
}
