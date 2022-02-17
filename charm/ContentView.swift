//
//  ContentView.swift
//  charm
//
//  Created by Emanuele Giunta on 08/02/22.
//

import SwiftUI
import SpriteKit

enum viewSwitcher: String, CaseIterable, Identifiable {
    case main
    case ar
    case menu
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State var maronn: viewSwitcher = .main
    
    var scene: GameScene {
            let scene = GameScene()
    //        scene.size = CGSize(width: 1000, height: 800)
            scene.scaleMode = .fill
            return scene
    }
    
    var body: some View {
        switch maronn {
        case .main:
            Text("A maronn")
                .onTapGesture{ maronn = .menu }
        case .ar:
            MARView()
        case .menu:
            SpriteView(scene: scene)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
