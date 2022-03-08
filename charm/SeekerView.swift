//
//  SeekerView.swift
//  charm
//
//  Created by Emanuele Giunta on 23/02/22.
//

import Foundation
import SwiftUI
import CoreLocation
import Lottie

var distanceParts: Double = 0

struct SeekerView: View {
    let nfam = false
    @ObservedObject var compassHeading: CompassHeading
    @Binding var pageSwitch: status
    
    var body: some View {
        
        ZStack (alignment: .center){
            Group {
                // White Arch
                Path { path in
                    path.move(to: CGPoint(x: width / 2, y: height / 2))
                    path.addArc(center: CGPoint(x: width / 2, y: height / 2), radius: width / 3, startAngle: Angle(degrees: -90.0), endAngle: Angle(degrees: 360.0), clockwise: false)
                }.fill(.white)
                //                        .offset(x: 0, y: 9)
                
                // Red Arch
                Path { path in
                    path.move(to: CGPoint(x: width / 2, y: height / 2))
                    path.addArc(center: CGPoint(x: width / 2, y: height / 2), radius: getHeightOfCompass(), startAngle: Angle(degrees: -135.0), endAngle: Angle(degrees: -45.0), clockwise: false)
                }.fill(Color.accentColor)
                //                        .offset(x: 0, y: 8)
                
            }.rotationEffect(Angle(degrees: self.compassHeading.degrees))
            Image("Exclude").scaleEffect(2).position(x: width / 2, y: height / 2)
            if nfam {
                Text("\(getDistance())")
                    .foregroundColor(.accentColor)
                    .offset(y: -height / 3)
                
            }
        }
    }
    
    func getHeightOfCompass() -> Double {
        if(self.compassHeading.distance <= 100) { pageSwitch = .seekerRadar }
        let maxRange = width / 30
        distanceParts = 10 - (self.compassHeading.distance / 100)
        return maxRange * distanceParts // * (self.compassHeading.distance / 1000)
    }
    
    func getDistance() -> Double {
        print(self.compassHeading.distance / 100)
        return self.compassHeading.distance / 100 // * (self.compassHeading.distance / 1000)
    }
}

enum ProgressKeyFrames: CGFloat {
    
    case start = 0
    
    case end = 720
    
    case complete = 936
    
}

struct RadarView: View {
    @Binding var pageSwitch: status
    @ObservedObject var compassHeading: CompassHeading
    
    var body: some View {
        RadarAnimation(compassHeading: compassHeading, pageSwitch: $pageSwitch).scaleEffect(0.50)
    }
}

struct RadarAnimation: UIViewRepresentable {
    @ObservedObject var compassHeading: CompassHeading
    @Binding var pageSwitch: status
    
    let aw = AnimationView()
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        aw.animation = Animation.named("Radar")
        aw.contentMode = .scaleAspectFit
        
        //        aw.animationSpeed = 3
        //        aw.play(fromFrame: ProgressKeyFrames.start.rawValue, toFrame: ProgressKeyFrames.end.rawValue, loopMode: .playOnce, completion: { (finished) in
        //            pageSwitch = .menu
        //        })
        //        aw.play(fromFrame: ProgressKeyFrames.end.rawValue, toFrame: ProgressKeyFrames.start.rawValue, loopMode: .playOnce, completion: { (finished) in
        //            pageSwitch = .menu
        //        })
        
        return aw
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        aw.animationSpeed = 0.5
        if self.compassHeading.distance >= 50 && self.compassHeading.distance <= 100 {
            let frame = (10 - round(self.compassHeading.distance)) * 72
            aw.play(fromFrame: frame, toFrame: frame + 72, loopMode: .autoReverse, completion: { (finished) in
                
            })
        } else if self.compassHeading.distance > 100 {
            aw.play(fromFrame: ProgressKeyFrames.complete.rawValue, toFrame: ProgressKeyFrames.end.rawValue, loopMode: .playOnce, completion: { (finished) in
                pageSwitch = .seekerCompass
            })
        } else if self.compassHeading.distance < 50 {
            aw.animationSpeed = 1
            aw.play(fromFrame: ProgressKeyFrames.end.rawValue, toFrame: ProgressKeyFrames.complete.rawValue, loopMode: .playOnce, completion: { (finished) in
                pageSwitch = .hider
            })
        }
    }
}

/*
 720 frame totali di animazione
 10 intervalli da 72 frame (in loop)
 
 if distanza > 100 -> Compass
 if 100 > distanza > 50 -> Radar
 if 50 > distanza -> AR
 
 */
