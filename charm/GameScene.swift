//
//  GameScene.swift
//  prova
//
//  Created by Felice De Giulio on 15/02/22.
//

import SpriteKit
import GameplayKit
import CoreMotion
import SwiftUI
import UIKit

//class GameScene: SKScene {
//
//    var linea : SKNode!
//    var tutorials : SKNode!
//    var settings : SKNode!
//    var achievements : SKNode!
//    var start : SKNode!
//
//    var motionManager = CMMotionManager()
//    var destX:CGFloat  = 0.0
//
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//
//        //        let action = SKAction.moveTo(x: destX, duration: 1)
//        //        linea.run(action)
//
//    }
//
//    override func didMove(to view: SKView) {
//
//        // 1
//        linea = SKSpriteNode(imageNamed: "LINEA")
//        tutorials = SKSpriteNode(imageNamed: "TUTORIALS")
//        settings = SKSpriteNode(imageNamed: "SETTINGS")
//        achievements = SKSpriteNode(imageNamed: "ACHIEVEMENTS")
//        start = SKSpriteNode(imageNamed: "START")
//
//        linea.position = CGPoint(x: 910, y: 1080)
//        //        linea.
//        self.addChild(linea)
//
//        tutorials.position = CGPoint(x: 910, y: 900)
//        self.addChild(tutorials)
//
//        settings.position = CGPoint(x: 910, y: 700)
//        self.addChild(settings)
//
//        achievements.position = CGPoint(x: 910, y: 500)
//        self.addChild(achievements)
//
//        start.position = CGPoint(x: 910, y: 300)
//        self.addChild(start)
//
//        //        if motionManager.isAccelerometerAvailable {
//        //            // 2
//        //            motionManager.accelerometerUpdateInterval = 0.01
//        //            motionManager.startAccelerometerUpdates(to: .main) {
//        //                (data, error) in
//        //                guard let data = data, error == nil else {
//        //                    return
//        //                }
//        //
//        //                // 3
//        //                let currentX = self.linea.position.x
//        //                self.destX = currentX + CGFloat(data.acceleration.x * 500)
//        //            }
//        //        }
//    }
//
//    func movement(){
//
//    }
//
//}
//
func gameView(state: stateSwitch) -> SKScene {
    let height = 2048
    let width = 1536
    let scene2 = SKScene()

    
    switch state {
    case .first:
        return firstStage()
    case .second:
        return secondStage()
    case .third:
        break
    }
    
    
    
    
    
    return scene2
}

class firstStage: SKScene {

    //    var linea : SKNode!
    //    var tutorials : SKNode!
    //    var settings : SKNode!
    //    var achievements : SKNode!
    //    var start : SKNode!
    let height = 2048
    let width = 1536
    
    //    linea = SKSpriteNode(imageNamed: "LINEA")
    var tutorials = SKSpriteNode(imageNamed: "TUTORIALS")
    var settings = SKSpriteNode(imageNamed: "SETTINGS")
    var achievements = SKSpriteNode(imageNamed: "ACHIEVEMENTS")
    var start = SKSpriteNode(imageNamed: "START")
    
    var linea = SKShapeNode()
    var paths = CGMutablePath()
    
    override func didMove(to view: SKView) {
        let scenex = self.scene!
        var cerchio = SKShapeNode(circleOfRadius: CGFloat(width / 20))
        var cerchio2 = SKShapeNode(circleOfRadius: CGFloat(width / 20))
        var cerchio3 = SKShapeNode(circleOfRadius: CGFloat(width / 20))
        var cerchio4 = SKShapeNode(circleOfRadius: CGFloat(width / 20))

        paths.move(to: CGPoint(x:width/2, y:0))
        paths.move(to: CGPoint(x:width/2, y:0))
        paths.addLine(to: CGPoint(x:width/2, y:height))
        linea.path = paths
        linea.strokeColor = .white
        linea.lineWidth = 10
        scenex.addChild(linea)
        
        cerchio.position = CGPoint(x: width/2, y: height/5 * 4)
        cerchio.fillColor = .white
        cerchio.strokeColor = .red
        scenex.addChild(cerchio)
        
        cerchio2.position = CGPoint(x: width/2, y: height/5 * 3)
        cerchio2.fillColor = .white
        cerchio2.strokeColor = .red
        scenex.addChild(cerchio2)
        
        cerchio3.position = CGPoint(x: width/2, y: height/5 * 2)
        cerchio3.fillColor = .white
        cerchio3.strokeColor = .red
        scenex.addChild(cerchio3)
        
        cerchio4.position = CGPoint(x: width/2, y: height/5)
        cerchio4.fillColor = .white
        cerchio4.strokeColor = .red
        
        scenex.addChild(cerchio4)
        
        tutorials.position = CGPoint(x: width/2, y: height/5 * 4)
        scenex.addChild(tutorials)
        
        settings.position = CGPoint(x: width/2, y: height/5 * 3)
        scenex.addChild(settings)
        
        achievements.position = CGPoint(x: width/2, y: height/5 * 2)
        scenex.addChild(achievements)
        
        start.position = CGPoint(x: width/2, y: height/5)
        scenex.addChild(start)
        
        scenex.size = CGSize(width: width, height: height)
        scenex.scaleMode = .aspectFill
    }
}

class secondStage: SKScene{
    let height = 2048
    let width = 1536
    var start = SKSpriteNode(imageNamed: "START")

    override func didMove(to view: SKView) {
        let scenex = self.scene!
        let linea = SKShapeNode()
        let paths = CGMutablePath()
        
        paths.move(to: CGPoint(x:width/2, y:height/6))
        paths.addLine(to: CGPoint(x:width/2, y:height))
        linea.path = paths
        linea.strokeColor = .white
        linea.lineWidth = 10
        scenex.addChild(linea)
        
        let cerchio = SKShapeNode(circleOfRadius: CGFloat(width / 20))
        cerchio.position = CGPoint(x: width/2, y: height/5 * 4)
        cerchio.fillColor = .white
        cerchio.strokeColor = .red
        scenex.addChild(cerchio)
        
        //        let cerchio2 = SKShapeNode(circleOfRadius: CGFloat(width / 20))
        //        cerchio2.position = CGPoint(x: width/2, y: height/5 * 3)
        //        cerchio2.fillColor = .white
        //        cerchio2.strokeColor = .red
        //        scene.addChild(cerchio2)
        //
        //        let cerchio3 = SKShapeNode(circleOfRadius: CGFloat(width / 20))
        //        cerchio3.position = CGPoint(x: width/2, y: height/5 * 2)
        //        cerchio3.fillColor = .white
        //        cerchio3.strokeColor = .red
        //        scene.addChild(cerchio3)
        
        start = SKSpriteNode(imageNamed: "START")
        start.position = CGPoint(x: width/2, y: height/5 * 4)
        scenex.addChild(start)
        
        scenex.size = CGSize(width: width, height: height)
        scenex.scaleMode = .aspectFill
    }
}
