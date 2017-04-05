//
//  Options.swift
//  Space Crusade
//
//  Created by Ahmad on 4/3/17.
//  Copyright © 2017 Ahmad El-baba. All rights reserved.
//

import Foundation
import SpriteKit

class Options: SKScene {
    
    let start = SKSpriteNode(imageNamed: "start.png")
    override func didMove(to view: SKView) {
        //remove box when title screen is made
        let backround = SKSpriteNode(color:UIColor.red, size: CGSize(width:1080,height:1920))
        backround.position = CGPoint(x: 540,y:960)
        backround.blendMode = .replace
        backround.zPosition = -1
        addChild(backround)
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
}
