//
//  SeekerView.swift
//  charm
//
//  Created by Emanuele Giunta on 23/02/22.
//

import Foundation
import SwiftUI
import CoreLocation

final class SeekerView: View {
    @ObservedObject var compassHeading: CompassHeading
    init(position: CLLocation) {
        compassHeading = CompassHeading(location: position)
    }

    let width = UIScreen.screenWidth
    let height = UIScreen.screenHeight
    
    var body: some View {
        ZStack (alignment: .center){
            Group {
                // Red Arch
                Path { path in
                    path.move(to: CGPoint(x: width / 2, y: height / 2))
                    path.addArc(center: CGPoint(x: width / 2, y: height / 2), radius: width / 3, startAngle: Angle(degrees: -135.0), endAngle: Angle(degrees: -45.0), clockwise: false)
                }.fill(.red)
                //                        .offset(x: 0, y: 8)
                
                // White Arch
                Path { path in
                    path.move(to: CGPoint(x: width / 2, y: height / 2))
                    path.addArc(center: CGPoint(x: width / 2, y: height / 2), radius: width / 3, startAngle: Angle(degrees: -45.0), endAngle: Angle(degrees: -135.0), clockwise: false)
                    
                }.fill(.white)
                //                        .offset(x: 0, y: 9)
            }.rotationEffect(Angle(degrees: self.compassHeading.degrees))
            Image("Exclude").scaleEffect(2).position(x: width / 2, y: height / 2)
        }
    }
}
