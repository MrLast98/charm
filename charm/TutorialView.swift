//
//  TutorialView.swift
//  charm
//
//  Created by Roberta Garofalo on 03/03/22.
//

import Foundation
import SwiftUI

struct TutorialView: View {
    @Binding var pageSwitch: status
    var body: some View {
        ZStack {
            Color.black
            Text("Charm is a game aimed to create childhood dynamics. \n Challenge your opponent hiding the cube in the surroundings, play with nothing but your fantasy!")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .foregroundColor(.pink)
                .frame(width:380)
                .lineSpacing(10)
                .onTapGesture {
                    pageSwitch = .menu
                }
        }
    }
}
