//
//  TitleScreenScene.swift
//  Space Crusade
//
//  Created by Ahmad on 3/23/17.
//  Copyright © 2017 Ahmad El-baba. All rights reserved.
//

import Foundation
import SpriteKit

class TitleScreenScene: SKScene {
    
       let start = SKSpriteNode(imageNamed: "start.png")
    override func didMove(to view: SKView) {
        //remove box when title screen is made
        let backround = SKSpriteNode(color:UIColor.blue, size: CGSize(width:1080,height:1920))
        backround.position = CGPoint(x: 540,y:960)
        backround.blendMode = .replace
        backround.zPosition = -1
        addChild(backround)
        
     
        start.position = CGPoint(x: 540,y:960)
        start.size = CGSize(width: 300,height:200)
        start.blendMode = .replace
        start.zPosition = -1
        addChild(start)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: self) {
            //let touchedNode = atPoint(location)
            
           
                let transition = SKTransition.reveal(with: .down, duration: 1.0)
                
                let nextScene = GameScene(size: scene!.size)
                nextScene.scaleMode = .aspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
            
        }
    }
    
}
