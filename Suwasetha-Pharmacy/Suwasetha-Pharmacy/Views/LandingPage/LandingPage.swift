//
//  LandingPage.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-14.
//

//import SwiftUI
//
//struct LandingPage: View {
//    @State private var showNextView = false
//
//    var body: some View {
//
//        NavigationView {
//            VStack(alignment: .leading){
//                Text("Suwaseth Online Phamarcy")
//                    .font(.largeTitle)
//                    .multilineTextAlignment(.leading)
//                Spacer()
//                VStack(alignment: .center) {
//                    Image("logo")
//                        .resizable()
//                        .frame(width: 280,height: 200)
//                        .aspectRatio(contentMode: .fill)
//                    Spacer()
//                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin molestie tempor urna, a suscipit urna suscipit et. Donec suscipit, quam a pharetra interdum, tellus lorem mattis elit, a auctor purus est et lectus.")
//                        .multilineTextAlignment(.leading)
//                    Spacer()
//
//                }
//
//
//                Spacer()
//                HStack{
//                    Spacer()
//                    Button(action: {
//                        showNextView = true
//                    }){
//                        HStack{
//                            Text("Get Start")
//                                .font(.title3)
//                                .bold()
//                                .foregroundColor(.white)
//                            Spacer()
//                            Image(systemName: "arrow.forward.circle.fill")
//                                .font(.title3)
//                                .foregroundColor(.white)
//                        }
//                    }
//                    .padding()
//                    .frame(width: 150, height: 50)
//                    .foregroundColor(.white)
//                    .background(CustomColor.darkPink)
//                    .cornerRadius(.infinity)
//                    .fullScreenCover(isPresented: $showNextView) {
//                        ContentView()
//                    }
//                }
//
//            }
//            .padding(.horizontal)
//            .padding(.top)
//            .frame(
//                maxWidth: .infinity,
//                maxHeight: .infinity,
//                alignment: .topLeading
//        )
//        }
//
//    }
//
//}
//
//struct LandingPage_Previews: PreviewProvider {
//    static var previews: some View {
//        LandingPage()
//    }
//}
import SwiftUI

struct LandingPage: View {
    @State private var showNextView = false

    var body: some View {
        ZStack {
            // Background Image
            Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

            // Continue Button
            VStack {
                Button(action: {
                    showNextView = true
                }){
                    HStack{
                        Text("Get Start")
                            .font(.title3)
                            .bold()

                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "arrow.forward.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(width: 180, height: 55)
                .foregroundColor(.white)
                .background(CustomColor.darkPink)
                .cornerRadius(.infinity)
                .fullScreenCover(isPresented: $showNextView) {
                    ContentView()
                }
            }.padding(.top, -120)
        }
        .fullScreenCover(isPresented: $showNextView) {
            ContentView()
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                showNextView = true
//            }
//        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home View")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
