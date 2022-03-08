//
//  ChoiceView.swift
//  charm
//
//  Created by Emanuele Giunta on 28/02/22.
//

import Foundation
import SwiftUI

enum choices: String, CaseIterable, Identifiable {
    case none
    case seeker
    case hider
    
    var id: String { self.rawValue }
}

struct ChoiceView: View {
    @Binding var pageSwitch: status
    var full = Path{ path in
        path.move(to: CGPoint(x: UIScreen.screenWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 4))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3 * 2, y: UIScreen.screenHeight / 3))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3 * 2, y: UIScreen.screenHeight / 3 * 2))
        path.move(to: CGPoint(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 4))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 3))
        path.addLine(to: CGPoint(x: UIScreen.screenWidth / 3, y: UIScreen.screenHeight / 2))
    }
    
    var body: some View {
        ZStack {
            full.stroke(lineWidth: 4).foregroundColor(.white)
            HStack {
                Button{
                    pageSwitch = .hider
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius, alignment: .leading)
                        .overlay(Image("Hider"))
                }.offset(y: -UIScreen.screenHeight / 10)
                Button{
                    pageSwitch = .menu
                } label: {
                    Circle()
                        .fill(Color.accentColor)
                        .frame(width: radius, height: radius, alignment: .leading)
                        .overlay(Image("Start-White"))
                }.offset(y: -UIScreen.screenHeight / 4)
                Button{
                    pageSwitch = .seekerCompass
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(width: radius, height: radius, alignment: .leading)
                        .overlay(Image("Seeker"))
                }
            }
        }
    }
}
