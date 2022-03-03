//
//  MenuView.swift
//  charm
//
//  Created by Emanuele Giunta on 22/02/22.
//

import Foundation
import SwiftUI

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct MenuView: View {
    let radius = UIScreen.screenWidth / 7
    @Binding var pageSwitch: status
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 4, height: UIScreen.screenHeight, alignment: .center)
            
            VStack(spacing: 60){
                HStack{
                    Text("Tutorials")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                    Button{
                        pageSwitch = .tutorial
                    } label: {
                        Circle()
                            .fill(.white)
                            .frame(width: radius, height: radius, alignment: .center)
                            .overlay(Image("Tutorials"))
                    }
                    Text("Tutorials")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                        .opacity(0.0)
                }
                .frame(width: UIScreen.screenWidth)
                //                .padding(.trailing, 80)
                
                HStack{
                    Text("Settings")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                        .opacity(0.0)
                    Button{
                        pageSwitch = .settings
                    } label: {
                        Circle()
                            .fill(.white)
                            .frame(width: radius, height: radius, alignment: .center)
                            .overlay(Image("Settings"))
                    }
                    Text("Settings")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                }
                .frame(width: UIScreen.screenWidth)
                //                .padding(.leading, 75.5)
                
                HStack{
                    Text("Achievements")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                    Button{
                        pageSwitch = .achievements
                    } label:{
                        Circle()
                            .fill(.white)
                            .frame(width: radius, height: radius, alignment: .center)
                            .overlay(Image("Achievements"))
                    }
                    Text("Achievements")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                        .opacity(0.0)
                }
                .frame(width: UIScreen.screenWidth)
                
                HStack{
                    Text("Start")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                        .opacity(0.0)
                    Button{
                        pageSwitch = .start
                    } label:{
                        Circle()
                            .fill(.white)
                            .frame(width: radius, height: radius, alignment: .center)
                            .overlay(Image("Start"))
                    }
                    Text("Start")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.trailing)
                }
                .frame(width: UIScreen.screenWidth)
                //                .padding(.leading, 50)
                
                Spacer()
            }
            .padding(.top, 204)
            
        }.edgesIgnoringSafeArea(.all)
    }
}
