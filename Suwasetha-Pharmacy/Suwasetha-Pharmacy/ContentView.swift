//
//  ContentView.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                    HomePage()
                        .tabItem{
                            Image(systemName: "house")
    //                        Text("Home")
                        }
                    ParmaciesPage()
                        .tabItem{
                            Image(systemName: "map")
    //                        Text("Doctor")
                        }
                    OrderPage()
                        .tabItem {
                            Image (systemName : "cart")
    //                        Text("Order")
                        }
                    ProfilePage()
                        .tabItem{
                            Image(systemName: "person")
    //                        Text("Profile")
                        }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
