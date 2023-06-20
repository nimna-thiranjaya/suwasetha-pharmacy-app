//
//  Suwasetha_PharmacyApp.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-14.
//

import SwiftUI

@main
struct Suwasetha_PharmacyApp: App {
    @StateObject private var dataCpntroller = OrderContoller()
    
    var body: some Scene {
        WindowGroup {
            LandingPage()
                .environment(\.managedObjectContext, dataCpntroller.container.viewContext)
        }
    }
}
