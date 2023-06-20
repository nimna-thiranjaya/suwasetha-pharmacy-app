//
//  Action.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-17.
//

import Foundation

struct Action : Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: ()-> Void
}
