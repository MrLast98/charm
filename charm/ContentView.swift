//
//  ContentView.swift
//  charm
//
//  Created by Emanuele Giunta on 08/02/22.
//

import SwiftUI
import SpriteKit
import UIKit

enum viewSwitcher: String, CaseIterable, Identifiable {
    case main
    case ar
    case menu
    var id: String { self.rawValue }
}

enum stateSwitch: String, CaseIterable, Identifiable {
    case first
    case second
    case third
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State var maronn: viewSwitcher = .menu
    @State var eddio: stateSwitch = .first
    
    var body: some View {
        switch maronn {
        case .main:
            Text("A maronn")
                .onTapGesture{ maronn = .ar }
        case .ar:
            MARView()
        case .menu:
            SpriteView(scene: gameView(state: eddio))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
