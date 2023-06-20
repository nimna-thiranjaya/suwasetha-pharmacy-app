//
//  MedicineCard.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-15.
//

import SwiftUI

struct MedicineCard: View {
   var medicine : Medicine
    var body: some View {

        VStack {
            Image(medicine.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 120)
                        .cornerRadius(8)
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(medicine.name)
                            .font(.caption.bold())
                            .lineLimit(2, reservesSpace: false)
                        HStack {
                            Text("Rs. \(String(format: "%.2f", medicine.price))")
                                .font(.caption2.bold())
                                .padding(.top, 8)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
                .frame(width: 155)
                .background()
                .cornerRadius(8)
                .shadow(radius: 10)
        }
    }


//struct MedicineCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineCard()
//    }
//}


//struct MedicineCards: View {
//    let medicine: Medicine
//    var body: some View {
