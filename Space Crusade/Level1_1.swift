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
    var score = 0
    var motionManager: CMMotionManager!
    let hero = Player(color:UIColor.blue, size: CGSize(width: 100, height: 200))
    
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
     
        hero.position = CGPoint(x: 540,y:300)
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
        let astroid = SKSpriteNode(color:UIColor.blue, size: CGSize(width: 100, height: 100))
        astroid.position = CGPoint(x: RandomInt(min: 0, max: 1080),y:1920)
        astroid.name = "astroid"
        astroid.physicsBody?.contactTestBitMask = (astroid.physicsBody?.collisionBitMask)!
        let actionMove = SKAction.move(to: CGPoint(x: astroid.position.x, y: 0), duration: TimeInterval(1.0))
        let actionMoveDone = SKAction.removeFromParent()
        astroid.run(SKAction.sequence([actionMove, actionMoveDone]))

        addChild(astroid)
        }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            let Px = accelerometerData.acceleration.y *
                -50
            let Py = accelerometerData.acceleration.x *
                50
            
            hero.position = CGPoint(x: Px, y:Py)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            if touchedNode.name == "right"{
                if  hero.position.x<1080 {
                    hero.position.x += 50
                    hero.position = CGPoint(x: hero.position.x,y:hero.position.y)
                }else{
                      hero.position.x = 1920
                }
            }
            if touchedNode.name == "left"{
            
                if  hero.position.x>0 {
                    hero.position.x -= 50
                    hero.position = CGPoint(x: hero.position.x,y:hero.position.y)
                }else{
                    hero.position.x = 0
                }            }
            if touchedNode.name == "shoot"{
                
                  let lazer = SKSpriteNode(color:UIColor.purple, size: CGSize(width: 50, height: 100))
                lazer.position = CGPoint(x: hero.position.x,y:hero.position.y)
                lazer.name = "lazer"
                lazer.physicsBody?.contactTestBitMask = (lazer.physicsBody?.collisionBitMask)!
                addChild(lazer)
                let actionMoveS = SKAction.move(to: CGPoint(x: hero.position.x, y: 1920), duration: TimeInterval(1.0))
                let actionMoveDoneS = SKAction.removeFromParent()
                lazer.run(SKAction.sequence([actionMoveS, actionMoveDoneS]))
            }
    
        }
}
    func collsionBetween(lazer: SKNode, object: SKNode){
        
        destroy(object:lazer)
        
        destroy(object:object)
        score+=1
        
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        print("here")
        if contact.bodyA.node?.name == "lazer"{
            print("Did")
            collsionBetween(lazer: contact.bodyA.node!, object: contact.bodyB.node!)
        }else if  contact.bodyB.node?.name == "lazer"{
             print("whhop")
            collsionBetween(lazer: contact.bodyB.node!, object: contact.bodyA.node!)
        }
    }
    
    func destroy(object: SKNode){
         object.removeFromParent()
        
    }
}
