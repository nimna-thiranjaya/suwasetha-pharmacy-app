//
//  ShowOder.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-16.
//

import SwiftUI

struct ShowOder: View {
    @Environment(\.managedObjectContext) var managedObjContext
    var order : Order
    @State private var showingUpdateView = false
    var body: some View {
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    if let imageData = order.prescription, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 260)
                            .cornerRadius(8)
                            .shadow(radius: 10)
                            .padding(.top)
                        Spacer()
                    }
                }
                Spacer()
  
                VStack(alignment: .center){
                    HStack {
                        Spacer()
                        Text("Patien Name : ")
                            .font(.title2)
                        Text(order.patientName!)
                            .font(.title2)
                        Spacer()

                    }
                    .padding(.top, 4)

                    HStack {
                        Spacer()
                        Text("Duration : ")
                            .font(.title2)
                        Text("\(order.duration)")
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.top, 4)
                    HStack {
                        Spacer()
                        Text("Address : ")
                            .font(.title2)
                        Text("\(order.address!)")
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.top, 4)
                    HStack {
                        Spacer()
                        Text("Gender : ")
                            .font(.title2)
                        Text("\(order.gender!)")
                            .font(.title2)
                        Spacer()

                    }
                    .padding(.top, 4)
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        OrderContoller().markOrderAsCompleted(order: order)
                    }){
                        Text("Confirm Order")
                            .padding(4)
                            .font(.body.bold())
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                Spacer()
                 
            }
            .navigationTitle("Show Order")
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showingUpdateView.toggle()
                    } label :{
                        Image(systemName: "square.and.pencil")
                            .font(.body)
                            .bold()
                            .foregroundColor(CustomColor.darkPink)
                    }
                }
            }
            .sheet(isPresented: $showingUpdateView) {
                UpdateOrder(order: order)
            }
        
    }
}
