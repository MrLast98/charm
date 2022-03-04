//
//  SettingsView.swift
//  charm
//
//  Created by Felice De Giulio on 24/02/22.
//

import SwiftUI

let radius = UIScreen.screenWidth / 7

enum settings: String, CaseIterable, Identifiable {
    case music
    case sfx
    case username
    
    var id: String { self.rawValue }
}

struct SettingsView: View {
    @Binding var pageSwitch: status
    @State var switchSettings: settings = .sfx
    
    var base = Path{ path in
        path.move(to: CGPoint(x: UIScreen.screenWidth / 6, y: UIScreen.screenHeight / 7 * 2))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 3))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 5 * 3))
    }
    
    var sfx = Path{ path in
        path.move(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 5 * 2))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 5 * 2, y: (UIScreen.screenHeight / 2) - UIScreen.screenHeight / 14))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 2, y: (UIScreen.screenHeight / 2) - UIScreen.screenHeight / 14))
    }
    
    var music = Path{ path in
        path.move(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 4))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 4 * 3))
    }
    
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: 4, height: UIScreen.screenHeight)
                .offset(x: -UIScreen.screenWidth / 3)
            if pageSwitch == .settings {
                base.stroke(lineWidth: 4).foregroundColor(.white)
                switch switchSettings {
                case .music:
                    HStack{
                        music.stroke(lineWidth: 4).foregroundColor(Color.accentColor)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth / 2, height: radius * 0.75)
                    }
                case .sfx:
                    HStack{
                        sfx.stroke(lineWidth: 4).foregroundColor(Color.accentColor)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth / 2, height: radius * 0.75)
                            .offset(y: -UIScreen.screenHeight / 14)
                    }
                case .username:
                    HStack{
                        sfx.stroke(lineWidth: 4).foregroundColor(Color.accentColor)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth / 2, height: radius * 0.75)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 60){
                HStack(alignment: .center, spacing: 5){
                    Button{
                        pageSwitch = .tutorial
                    } label: {
                        Circle()
                            .fill(.white)
                            .frame(width: radius, height: radius)
                            .overlay(Image("Tutorials"))
                    }
                    Text("Tutorials")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                HStack(alignment: .center, spacing: 5){
                    Button{
                        if pageSwitch == .settings {
                            pageSwitch = .menu
                        } else {
                            pageSwitch = .settings
                        }
                    } label: {
                        Circle()
                            .fill(pageSwitch == .settings ? Color.accentColor : .white)
                            .frame(width: radius, height: radius)
                            .overlay(Image((pageSwitch == .settings ? "Settings-White" : "Settings")))
                    }
                    Text("Settings")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(pageSwitch == .settings ? Color.accentColor : .white)
                }
                
                if pageSwitch == .settings {
                    VStack(alignment: .leading , spacing: 30){
                        HStack {
                            Circle()
                                .fill(switchSettings == .sfx ? Color.accentColor : .white)
                                .frame(width: radius * 0.75 , height: radius  * 0.75)
                                .overlay(Image("Sound"))
                                .onTapGesture {
                                    switchSettings = .sfx
                                }
                            Text("Sound Effects")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }.frame(width: UIScreen.screenWidth / 2, height: radius * 0.75, alignment: .leading)
                        
                        HStack {
                            Circle()
                                .fill(switchSettings == .music ? Color.accentColor : .white)
                                .frame(width: radius * 0.75 , height: radius  * 0.75)
                                .overlay(Image("Volume-White"))
                                .onTapGesture {
                                    switchSettings = .music
                                }
                            Text("Music")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }.frame(width: UIScreen.screenWidth / 2, height: radius * 0.75, alignment: .leading)
                        
                        HStack {
                            Circle()
                                .fill(switchSettings == .username ? Color.accentColor : .white)
                                .frame(width: radius * 0.75 , height: radius * 0.75)
                                .overlay(Image("User"))
                                .onTapGesture {
                                    switchSettings = .username
                                }
                            Text("User")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }.frame(width: UIScreen.screenWidth / 2, height: radius * 0.75, alignment: .leading)
                    }.frame(width: radius).offset(x: UIScreen.screenWidth / 3)
                }
                
                HStack(alignment: .center, spacing: 5){
                    Button{
                        if pageSwitch == .achievements {
                            pageSwitch = .menu
                        } else {
                            pageSwitch = .achievements
                        }
                    } label:{
                        Circle()
                            .fill(pageSwitch == .achievements ? Color.accentColor : .white)
                            .frame(width: radius, height: radius)
                            .overlay(Image((pageSwitch == .achievements ? "Achievements-White" : "Achievements")))
                    }
                    Text("Achievements")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(pageSwitch == .achievements ? Color.accentColor : .white)
                }
                
                HStack(alignment: .center, spacing: 5){
                    Button{
                        pageSwitch = .start
                    } label:{
                        Circle()
                            .fill(.white)
                            .frame(width: radius, height: radius)
                            .overlay(Image("Start"))
                    }
                    Text("Start")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }.frame(height: UIScreen.screenHeight / 6 * 5).offset(x: -UIScreen.screenWidth / 6)
        }.padding(.top)
    }
}
