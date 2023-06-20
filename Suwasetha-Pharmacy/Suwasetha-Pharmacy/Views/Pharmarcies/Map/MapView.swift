//
//  MapView.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-17.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapController: MapController
    
 

    var body: some View {
        VStack {
            Map(coordinateRegion: $mapController.region, annotationItems: mapController.businesses) { business in
                MapAnnotation(coordinate: business.coordinate) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.title)
                        .foregroundColor(.pink)
                        .onTapGesture {
                            mapController.setSelectBusiness(for: business)
                        }
                }
                
            }
            .edgesIgnoringSafeArea(.top)
            .sheet(isPresented: $mapController.isBusinessViewShowing) {
                BusinessView(mapController: mapController)
                    .presentationDetents([.fraction(0.27), .large])
        }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapController: MapController())
    }
}
