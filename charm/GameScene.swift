//
//  GameScene.swift
//  prova
//
//  Created by Felice De Giulio on 15/02/22.
//

import SpriteKit
import GameplayKit
import CoreMotion


class GameScene: SKScene {
    
    var linea : SKNode!
    var tutorials : SKNode!
    var settings : SKNode!
    var achievements : SKNode!
    var start : SKNode!
    
    var motionManager = CMMotionManager()
    var destX:CGFloat  = 0.0
    


    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        let action = SKAction.moveTo(x: destX, duration: 1)
        linea.run(action)
        
    }
    
   override func didMove(to view: SKView) {

        // 1
        linea = SKSpriteNode(imageNamed: "linea")
        tutorials = SKSpriteNode(imageNamed: "tutorials")
        settings = SKSpriteNode(imageNamed: "settings")
        achievements = SKSpriteNode(imageNamed: "achievements")
        start = SKSpriteNode(imageNamed: "start")




        linea.position = CGPoint(x: 0, y: 896)
        self.addChild(linea)

        tutorials.position = CGPoint(x: 0, y: 560)
//        self.addChild(tutorials)

        settings.position = CGPoint(x: 0, y: 300)
//        self.addChild(settings)

        achievements.position = CGPoint(x: 0, y: 50)
//        self.addChild(achievements)

        start.position = CGPoint(x: 0, y: -200)
//        self.addChild(start)




        if motionManager.isAccelerometerAvailable {
            // 2
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: .main) {
                (data, error) in
                guard let data = data, error == nil else {
                    return
                }

                // 3
                let currentX = self.linea.position.x
                self.destX = currentX + CGFloat(data.acceleration.x * 500)
            }
        }
    }
    
    func movement(){

        
    }
    
}
