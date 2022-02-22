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
    @State var status: Int = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 4, height: UIScreen.screenHeight, alignment: .center)
    
            VStack(spacing: 60){
                
                Button{
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius, alignment: .center)
                        .overlay(Image("Tutorials"))
                        .onTapGesture{
                            status = 1
                            print(status)
                        }
                    }
                
                Button{
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label:{
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius, alignment: .center)
                        .overlay(Image("Settings"))
                        .onTapGesture{
                            status = 2
                            print(status)
                        }
                    }
                
                Button{
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label:{
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius, alignment: .center)
                        .overlay(Image("Achievements"))
                        .onTapGesture{
                            status = 3
                            print(status)
                        }
                    }
                
                Button{
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label:{
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius, alignment: .center)
                        .overlay(Image("Start"))
                        .onTapGesture{
                            status = 3
                            print(status)
                        }
                    }
    
                Spacer()
            }
            .padding(.top, 204)
            
        }.edgesIgnoringSafeArea(.all)
    }
}
