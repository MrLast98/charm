//
//  ContentView.swift
//  charm
//
//  Created by Emanuele Giunta on 08/02/22.
//

import SwiftUI

let width = UIScreen.screenWidth
let height = UIScreen.screenHeight

enum status: String, CaseIterable, Identifiable {
    case tutorial
    case menu
    case settings
    case achievements
    case start
    case seeker
    case hider
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State var pickedView: status
    var body: some View {
        switch pickedView {
        case .tutorial:
            TutorialView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .menu:
            MenuView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .settings:
            SettingsView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .achievements:
            SettingsView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .start:
            ChoiceView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .seeker:
            ChoiceView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .hider:
            ZStack {
                MARView().edgesIgnoringSafeArea(.all)
                Button{
                     pickedView = .menu
                } label:{
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius)
                        .overlay(Image("Achievements"))
                }
            }
        }
    }
}
