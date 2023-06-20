//
//  MapPresentView.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-17.
//
import SwiftUI

struct MapPresentView: View {
    @StateObject var mapController = MapController()
    func onRun (serchKey: String) {
        mapController.searchTerm = serchKey
        mapController.search()
    }
    
    var body: some View {
        
        VStack {
            MapView(mapController: mapController)
        }
        .onAppear(){
            onRun(serchKey: "Pharmacy")
    }
        .overlay(
            HStack {
                Spacer()
                Button(action: {
                           onRun(serchKey: "Pharmacy")
                       }) {
                           Image(systemName: "location.magnifyingglass")
                               .resizable()
                               .frame(width: 20, height: 20)
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.blue)
                               .clipShape(Circle())
                       }
                   .padding(.bottom, 50)
            }
                .padding()// Adjust the bottom padding as needed
                   , alignment: .bottom // Adjust the alignment as needed
               )
//        }
//        .searchable(text: $mapController.searchTerm)
//        .onSubmit(of: .search) {
//            mapController.search()
//        }
    }
}

struct MapPresentView_Previews: PreviewProvider {
    static var previews: some View {
        MapPresentView()
    }
}
