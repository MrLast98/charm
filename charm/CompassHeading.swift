//
//  CompassHeading.swift
//  charm
//
//  Created by Emanuele Giunta on 24/02/22.
//

import Foundation
import Combine
import CoreLocation

class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var distance = 100
    var destination: CLLocation
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }
    var position: CLLocation = .init() {
        didSet {
            objectWillChange.send()
        }
    }
    
    private let locationManager = CLLocationManager()
    
    init(location: CLLocation) {
        self.destination = location
        super.init()
        self.locationManager.delegate = self
        //        self.locationManager.headingOrientation = .portrait
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.setup()
    }
    
    
    private func setup() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.degrees = -1 * newHeading.magneticHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last!
        print(lastLocation)
    }
    
}

extension BinaryFloatingPoint {
    var dms: (degrees: Double, minutes: Double, seconds: Double) {
        var seconds = Double(self * 3600)
        let degrees = seconds / 3600
        seconds = seconds.truncatingRemainder(dividingBy: 3600)
        let minutes = seconds / 60
        seconds = seconds.truncatingRemainder(dividingBy: 60)
        return (degrees, minutes, seconds)
    }
}

extension CLLocationCoordinate2D {
    var latitudeDMS: String {
        let (degrees, minutes, seconds) = latitude.dms
        return String(format: "%.0f°%.0f'%.2f\"%@", abs(degrees), abs(minutes), abs(seconds), degrees >= 0 ? "N" : "S")
    }
    var longitudeDMS: String {
        let (degrees, minutes, seconds) = longitude.dms
        return String(format: "%.0f°%.0f'%.2f\"%@", abs(degrees), abs(minutes), abs(seconds), degrees >= 0 ? "E" : "W")
    }
}
