//
//  ContentView.swift
//  charm
//
//  Created by Emanuele Giunta on 08/02/22.
//

import SwiftUI
import CoreLocation

let width = UIScreen.screenWidth
let height = UIScreen.screenHeight

enum status: String, CaseIterable, Identifiable {
    case tutorial
    case menu
    case settings
    case achievements
    case start
    case seekerCompass
    case seekerRadar
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
        case .seekerCompass:
            SeekerView(compassHeading: getChallenge(), pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .seekerRadar:
            RadarView(pageSwitch: $pickedView, compassHeading: getChallenge()).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        case .hider:
            MARView(pageSwitch: $pickedView).edgesIgnoringSafeArea(.all).preferredColorScheme(.dark)
        }
    }
    
    func getChallenge() -> CompassHeading {
        let loc = CLLocation(latitude: 40.837783, longitude: 14.312102)
        let compass = CompassHeading(location: loc)
        return compass
    }
}
