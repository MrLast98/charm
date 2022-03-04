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
        VStack {
            Text("CHARM is an AR experience you have with your friends. Dive back into your childhood memories,")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .foregroundColor(.pink)
                .frame(width:380)
                .lineSpacing(10)
            Text("Hide your little Charm around you and challenge your friend to find it.")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.pink)
                .frame(width:380)
                .lineSpacing(10)
            Text("As a Seeker, track the Charm with the Compass, the Radar and through AR Hints!")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .foregroundColor(.pink)
                .frame(width:380)
                .lineSpacing(10)
        }.onTapGesture {
            pageSwitch = .menu
        }
    }
}



