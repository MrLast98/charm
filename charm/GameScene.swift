//
//  GameScene.swift
//  prova
//
//  Created by Felice De Giulio on 15/02/22.
//

import SpriteKit
import GameplayKit
import SwiftUI
import UIKit
import Combine

//struct menuView: UIViewRepresentable {
//    let view = SKView()
//
//    func makeUIView(context: Context) -> UIView {
//
//        return view
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
//
//    func updateUIView(_ view: UIView, context: Context) {
//
//    }
//
//
//}
//
//class Coordinator2: NSObject {
//
//    let viewState: viewState
//
//    init(viewState: viewState) {
//        self.viewState = viewState
//    }
//}

class menuScreen: SKScene {
    // Altezza e Larghezza predefinite
    let height = 2048
    let width = 1536
    
    // Creazione nodi immagini
    var tutorials = SKSpriteNode(imageNamed: "TUTORIALS")
    var settings = SKSpriteNode(imageNamed: "SETTINGS")
    var achievements = SKSpriteNode(imageNamed: "ACHIEVEMENTS")
    var start = SKSpriteNode(imageNamed: "START")
    
    // Creazione nodi cerchi
    let cerchio2 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio4 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio3 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    
    var linea = SKShapeNode()
    var paths = CGMutablePath()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        for touch in touches {
            let location = touch.location(in:self)
            if cerchio4.contains(location) {
                view?.presentScene(startScreen())
            }
            if cerchio2.contains(location) {
                view?.presentScene(settingsScreen())
            }
            if cerchio3.contains(location) {
                view?.presentScene(achievementsScreen())
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        let scenex = self.scene!
        let cerchio = SKShapeNode(circleOfRadius: CGFloat(width / 23))
        
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


class startScreen: SKScene {
    @State var doStart = false
    
    let height = 2048
    let width = 1536
    var start = SKSpriteNode(imageNamed: "START")
    let cerchio = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio1 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio2 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        for touch in touches {
            let location = touch.location(in:self)
            if cerchio.contains(location) {
                view?.presentScene(menuScreen())
            }
            if cerchio1.contains(location) || cerchio2.contains(location) {
                doStart = true
            }
        }
    }
    
    override func didMove(to view: SKView) {
        let scenex = self.scene!
        let linea = SKShapeNode()
        let paths = CGMutablePath()
        
        paths.move(to: CGPoint(x:width/2, y:height/5 * 4))
        paths.addLine(to: CGPoint(x:width/2, y:height))
        
        // Start Button
        cerchio.position = CGPoint(x: width/2, y: height/5 * 4)
        cerchio.fillColor = .white
        cerchio.strokeColor = .red
        scenex.addChild(cerchio)
        
        // Left branch
        paths.move(to: CGPoint(x: width/2, y: height/5 * 4))
        paths.addLine(to: CGPoint(x:width/3, y:height/3 * 2))
        paths.move(to: CGPoint(x:width/3, y:height/3 * 2))
        paths.addLine(to: CGPoint(x:width/3, y:height/2))
        
        // Right Branch
        paths.move(to: CGPoint(x: width/2, y: height/5 * 4))
        paths.addLine(to: CGPoint(x:width/3*2, y:height/3 * 2))
        paths.move(to: CGPoint(x:width/3*2, y:height/3 * 2))
        paths.addLine(to: CGPoint(x:width/3*2, y:height/3))
        
        // Hider
        cerchio1.position = CGPoint(x: width/3, y: height/5 * 3)
        cerchio1.fillColor = .white
        cerchio1.strokeColor = .red
        scenex.addChild(cerchio1)
        
        // Seeker
        cerchio2.position = CGPoint(x: width/3*2, y: height/2)
        cerchio2.fillColor = .white
        cerchio2.strokeColor = .red
        scenex.addChild(cerchio2)
        
        linea.path = paths
        linea.strokeColor = .white
        linea.lineWidth = 10
        scenex.addChild(linea)
        
        start = SKSpriteNode(imageNamed: "START")
        start.position = CGPoint(x: width/2, y: height/5 * 4)
        scenex.addChild(start)
        
        scenex.size = CGSize(width: width, height: height)
        scenex.scaleMode = .aspectFill
    }
}

class settingsScreen: SKScene {
    let height = 2048
    let width = 1536
    
    //    linea = SKSpriteNode(imageNamed: "LINEA")
    var tutorials = SKSpriteNode(imageNamed: "TUTORIALS")
    var settings = SKSpriteNode(imageNamed: "SETTINGS")
    var achievements = SKSpriteNode(imageNamed: "ACHIEVEMENTS")
    var start = SKSpriteNode(imageNamed: "START")
    
    let cerchio2 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio4 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    
    
    var linea = SKShapeNode()
    var paths = CGMutablePath()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        for touch in touches {
            let location = touch.location(in:self)
            if cerchio4.contains(location) {
                view?.presentScene(startScreen())
            }
            if cerchio2.contains(location) {
                view?.presentScene(menuScreen())
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        let scenex = self.scene!
        let cerchio = SKShapeNode(circleOfRadius: CGFloat(width / 23))
        //        let cerchio2 = SKShapeNode(circleOfRadius: CGFloat(width / 23))
        let cerchio3 = SKShapeNode(circleOfRadius: CGFloat(width / 23))
        //        let cerchio4 = SKShapeNode(circleOfRadius: CGFloat(width / 23))
        let cerchio5 = SKShapeNode(circleOfRadius: CGFloat(width / 26))
        let cerchio6 = SKShapeNode(circleOfRadius: CGFloat(width / 26))
        
        
        
        let xalign = width/4
        paths.move(to: CGPoint(x:xalign, y:0))
        paths.addLine(to: CGPoint(x:xalign, y:height))
        
        paths.move(to:CGPoint(x:xalign, y:height/3*2))
        paths.addLine(to:CGPoint(x:width/5*2, y: height/5*3))
        
        paths.move(to: CGPoint(x:width/5*2, y: height/5*3))
        paths.addLine(to: CGPoint(x:width/5*2, y: height/5*2))
        
        linea.path = paths
        linea.strokeColor = .white
        linea.lineWidth = 10
        scenex.addChild(linea)
        
        cerchio.position = CGPoint(x: xalign, y: height/6*5)
        cerchio.fillColor = .white
        cerchio.strokeColor = .red
        scenex.addChild(cerchio)
        
        cerchio2.position = CGPoint(x: xalign, y: height/3*2)
        cerchio2.fillColor = .white
        cerchio2.strokeColor = .red
        scenex.addChild(cerchio2)
        
        cerchio3.position = CGPoint(x: xalign, y: height/3)
        cerchio3.fillColor = .white
        cerchio3.strokeColor = .red
        scenex.addChild(cerchio3)
        
        cerchio4.position = CGPoint(x: xalign, y: height/5)
        cerchio4.fillColor = .white
        cerchio4.strokeColor = .red
        scenex.addChild(cerchio4)
        
        cerchio5.position = CGPoint(x: width/5*2, y: height/5*3)
        cerchio5.fillColor = .white
        cerchio5.strokeColor = .red
        scenex.addChild(cerchio5)
        
        cerchio6.position = CGPoint(x: width/5*2, y: height/5*2)
        cerchio6.fillColor = .white
        cerchio6.strokeColor = .red
        scenex.addChild(cerchio6)
        
        tutorials.position = CGPoint(x: xalign, y: height/6*5)
        scenex.addChild(tutorials)
        
        settings.position = CGPoint(x: xalign, y: height/3*2)
        scenex.addChild(settings)
        
        achievements.position = CGPoint(x: xalign, y: height/3)
        scenex.addChild(achievements)
        
        start.position = CGPoint(x: xalign, y: height/5)
        scenex.addChild(start)
        
        scenex.size = CGSize(width: width, height: height)
        scenex.scaleMode = .aspectFill
    }
}

class achievementsScreen: SKScene {
    let height = 2048
    let width = 1536
    
    //    linea = SKSpriteNode(imageNamed: "LINEA")
    var tutorials = SKSpriteNode(imageNamed: "TUTORIALS")
    var settings = SKSpriteNode(imageNamed: "SETTINGS")
    var achievements = SKSpriteNode(imageNamed: "ACHIEVEMENTS")
    var start = SKSpriteNode(imageNamed: "START")
    
    let cerchio2 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio3 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    let cerchio4 = SKShapeNode(circleOfRadius: CGFloat(1536 / 23))
    
    
    var linea = SKShapeNode()
    var paths = CGMutablePath()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        for touch in touches {
            let location = touch.location(in:self)
            if cerchio4.contains(location) {
                view?.presentScene(startScreen())
            }
            if cerchio2.contains(location) {
                view?.presentScene(settingsScreen())
            }
            if cerchio3.contains(location) {
                view?.presentScene(menuScreen())
            }
        }
    }
    
    override func didMove(to view: SKView) {
        
        let scenex = self.scene!
        let cerchio = SKShapeNode(circleOfRadius: CGFloat(width / 23))
        let rettangolo = SKShapeNode(rect: CGRect(x: width/3, y: height/5*2, width: width/5*2, height: height/6))
        
        let xalign = width/4
        paths.move(to: CGPoint(x:xalign, y:0))
        paths.addLine(to: CGPoint(x:xalign, y:height))
        
        paths.move(to:CGPoint(x:xalign, y:height/2))
        paths.addLine(to:CGPoint(x:width/3, y: height/5*2))
        
        linea.path = paths
        linea.strokeColor = .white
        linea.lineWidth = 10
        scenex.addChild(linea)
        
        rettangolo.strokeColor = .red
        rettangolo.fillColor = .white
        scenex.addChild(rettangolo)
        
        cerchio.position = CGPoint(x: xalign, y: height/6*5)
        cerchio.fillColor = .white
        cerchio.strokeColor = .red
        scenex.addChild(cerchio)
        
        cerchio2.position = CGPoint(x: xalign, y: height/3*2)
        cerchio2.fillColor = .white
        cerchio2.strokeColor = .red
        scenex.addChild(cerchio2)
        
        cerchio3.position = CGPoint(x: xalign, y: height/2)
        cerchio3.fillColor = .white
        cerchio3.strokeColor = .red
        scenex.addChild(cerchio3)
        
        cerchio4.position = CGPoint(x: xalign, y: height/5)
        cerchio4.fillColor = .white
        cerchio4.strokeColor = .red
        scenex.addChild(cerchio4)
        
        tutorials.position = CGPoint(x: xalign, y: height/6*5)
        scenex.addChild(tutorials)
        
        settings.position = CGPoint(x: xalign, y: height/3*2)
        scenex.addChild(settings)
        
        achievements.position = CGPoint(x: xalign, y: height/3)
        scenex.addChild(achievements)
        
        start.position = CGPoint(x: xalign, y: height/5)
        scenex.addChild(start)
        
        scenex.size = CGSize(width: width, height: height)
        scenex.scaleMode = .aspectFill
    }
}
