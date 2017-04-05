//
//  Level1_1.swift
//  Space Crusade
//
//  Created by Ahmad on 3/30/17.
//  Copyright © 2017 Ahmad El-baba. All rights reserved.
//

import SpriteKit
import CoreMotion



class Level1_1: SKScene {
    
    var motionManager: CMMotionManager!
    let hero = Player(color:UIColor.blue, size: CGSize(width: 100, height: 200))
    let astroid = SKSpriteNode(color:UIColor.blue, size: CGSize(width: 100, height: 100))
    let left = SKSpriteNode(color:UIColor.green, size: CGSize(width: 100, height: 100))
    let right = SKSpriteNode(color:UIColor.red, size: CGSize(width: 100, height: 100))
    let shoot = SKSpriteNode(color:UIColor.black, size: CGSize(width: 100, height: 100))
    var gameTimer: Timer!
   
    
    override func didMove(to view: SKView) {
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)  // Starts it repeating

        
        let backround = SKSpriteNode(color:UIColor.brown, size: CGSize(width:1080,height:1920))
        backround.position = CGPoint(x: 540,y:960)
        backround.blendMode = .replace
        backround.zPosition = -1
        addChild(backround)
        
         //start position
        hero.setPx(540)
        hero.setPy(300)
        hero.position = CGPoint(x: hero.getPx(),y:hero.getPy())
        hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
        hero.physicsBody!.isDynamic=false
        addChild(hero)
        
       
        
        //gameTimer.fire() // Fires it right then

        
        left.position = CGPoint(x: 200,y:100)
        left.name = "left"
        addChild(left)
        
        shoot.position = CGPoint(x: 540,y:100)
        shoot.name = "shoot"
        addChild(shoot)
        
        right.position = CGPoint(x: 700,y:100)
        right.name = "right"
        addChild(right)
        
        
    
      
    }
     func runTimedCode() {  // Will run every 5 seconds
        
        
        }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y *
                -50, dy: accelerometerData.acceleration.x * 50)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            if touchedNode.name == "right"{
              hero.setPx(hero.getPx()+50)
              hero.position = CGPoint(x: hero.getPx(),y:hero.getPy())
            }
            if touchedNode.name == "left"{
                  hero.setPx(hero.getPx()-50)
                     hero.position = CGPoint(x: hero.getPx(),y:hero.getPy())
            }
            if touchedNode.name == "shoot"{
                
                  let lazer = SKSpriteNode(color:UIColor.purple, size: CGSize(width: 50, height: 100))
                lazer.position = CGPoint(x: 540,y:100)
                lazer.name = "lazer"
                var path = CGMutablePath()
              //  CGPathMoveToPoint(path, nil, 0, 0)
               // CGPathAddLineToPoint(path, nil, 50, 100)
               // var followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: 3.0)
                addChild(lazer)
            }
    
        }
}
}
