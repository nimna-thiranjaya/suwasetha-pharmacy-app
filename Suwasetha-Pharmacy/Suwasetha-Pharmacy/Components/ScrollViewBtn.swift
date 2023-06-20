//
//  ScrollViewBtn.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-14.
//

import SwiftUI

struct ScrollViewBtn: View {
    var icon = ""
    var text = ""
    var function : () -> Void
    var body: some View {
        VStack{
            Button(action: function) {
                        Image(systemName: icon)
                              .font(.subheadline)
                              .foregroundColor(.black)
                      }
                      .padding()
                      .background(CustomColor.litePink)
                      .foregroundColor(.white)
                      .clipShape(Circle())
            Text(text)
                .font(.caption)
                .bold()
                .foregroundColor(.gray)
        }
    }
}


