//
//  ContentView.swift
//  charm
//
//  Created by Emanuele Giunta on 08/02/22.
//

import SwiftUI
import SpriteKit

//class viewState: ObservableObject {
//    @Published var state: Bool = false
//    @Published var lastHiddenObject: String = ""
//
//    init(state: Bool, lastHiddenObject: String) {
//        self.state = state
//        self.lastHiddenObject = lastHiddenObject
//    }
//}

struct ContentView: View {
//    @StateObject var menuState: viewState = viewState(state: false, lastHiddenObject: "")
    
    var body: some View {
//        if(menuState.state) {
//            MARView()
//        } else {
//            SpriteView(scene: menuScreen())
//        }
        MenuView()
    }
}


