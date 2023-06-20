//
//  OrderCard.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-16.
//

import SwiftUI

struct OrderCard: View {
//    var image: UIImage
//    var patientName : String = ""
//    var duration: Double
//    var status : String = ""
//    var selectedimage: Data = .init(count: 0)
    
    var order: Order
    var body: some View {
        HStack(alignment: .center) {
            if let imageData = order.prescription, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(width: 120)
                    .frame(maxWidth: 120)
                    .frame(height: 100)
                    .frame(maxHeight: 100)
                    .padding(10)
            }
            
            VStack(alignment: .leading) {
                Text(order.patientName ?? "" )
                    .font(.headline)
                Text("Duration : \(Int16(order.duration)) days")
                    .font(.subheadline)
                    .foregroundColor(.black)
                HStack{
                    Spacer()
                    if(order.orderStatus == "Pending") {
                        Text("Order \(order.orderStatus ?? "")..")
                            .font(.caption)
                            .bold()
                            .padding(6)
                            .background(CustomColor.darkPink)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }else {
                        Text("Order \(order.orderStatus ?? "")..")
                            .font(.caption)
                            .bold()
                            .padding(6)
                            .background(.green)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.white)
        .modifier(CardModifier())
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 5)
        .listRowInsets(EdgeInsets())
    }
}
