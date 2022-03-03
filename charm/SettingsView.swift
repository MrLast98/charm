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
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 5 * 2))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 5 * 3))
    }
    
    var sfx = Path{ path in
        path.move(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 3))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 2))
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
                base.stroke(lineWidth: 4).foregroundColor(.red)
                switch switchSettings {
                case .music:
                    HStack{
                        music.stroke(lineWidth: 4).foregroundColor(.red)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth / 2, height: radius * 0.75)
                    }
                case .sfx:
                    HStack{
                        sfx.stroke(lineWidth: 4).foregroundColor(.red)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth / 3, height: radius * 0.75)
                    }
                case .username:
                    HStack{
                        sfx.stroke(lineWidth: 4).foregroundColor(.red)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth / 3, height: radius * 0.75)
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
                            .fill(pageSwitch == .settings ? .red : .white)
                            .frame(width: radius, height: radius)
                            .overlay(Image("Settings"))
                    }
                    Text("Settings")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                if pageSwitch == .settings {
                    ZStack{
                        VStack(alignment: .leading, spacing: 30){
                            Circle()
                                .fill(.white)
                                .frame(width: radius * 0.75 , height: radius  * 0.75)
                                .onTapGesture {
                                    switchSettings = .sfx
                                }
                            Circle()
                                .fill(.white)
                                .frame(width: radius * 0.75 , height: radius  * 0.75)
                                .onTapGesture {
                                    switchSettings = .music
                                }
                            Circle()
                                .fill(.white)
                                .frame(width: radius * 0.75 , height: radius * 0.75)
                                .onTapGesture {
                                    switchSettings = .username
                                }
                        }.padding(.top)
                    }.frame(width: radius).offset(x: UIScreen.screenWidth / 6)
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
                            .fill(pageSwitch == .achievements ? .red : .white)
                            .frame(width: radius, height: radius)
                            .overlay(Image("Achievements"))
                    }
                    Text("Achievements")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
