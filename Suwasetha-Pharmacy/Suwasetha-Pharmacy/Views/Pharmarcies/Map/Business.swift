//
//  Business.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-17.
//

import Foundation
import MapKit

struct Business: Identifiable {
    let id = UUID()
    let name: String
    let placemark: MKPlacemark
    let coordinate: CLLocationCoordinate2D
    let phoneNumber: String
    let website: URL?
}
