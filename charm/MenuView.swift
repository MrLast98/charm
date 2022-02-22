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
            Circle()
                .fill(.white)
                .frame(width: radius, height: radius, alignment: .center)
                .position(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 4)
                .onTapGesture{
                    status = 1
                    print(status)
                }
            Rectangle()
                .fill(.white)
                .frame(width: 4, height: UIScreen.screenHeight, alignment: .center)
        }.edgesIgnoringSafeArea(.all)
    }
}
