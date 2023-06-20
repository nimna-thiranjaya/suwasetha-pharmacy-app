//
//  Medicines.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-15.
//

import Foundation
import SwiftUI
struct Medicine {
    var id : String
    var name : String
    var image : String
    var company: String
    var price : Double
}


let medicines : [Medicine] = [
    Medicine(id: "1", name: "Methylenetetrahydrofolate", image: "m1", company: "Test Name", price: 40.00),
    Medicine(id: "2", name: "Tramadol Hydrochloride", image: "m2", company: "Test Name", price: 10.00),
    Medicine(id: "3", name: "Levothyroxine Sodium", image: "m3",company: "Test Name", price: 34.98),
    Medicine(id: "4", name: "Amoxicillin-Clavulanate", image: "m4",company: "Test Name", price: 02.00),
    Medicine(id: "5", name: "Prednisolone Acetate", image: "m5",company: "Test Name", price: 12.80),
    Medicine(id: "6", name: "Ceftriaxone Sodium", image: "m1",company: "Test Name", price: 24.99),
    Medicine(id: "7", name: "Atenolol-Chlorthalidone", image: "m2",company: "Test Name", price: 20.90),
    Medicine(id: "8", name: "Clotrimazole-Betamethasone", image: "m3", company: "Test Name", price: 40.00),
    Medicine(id: "10", name: "Isosorbide Mononitrate", image: "m4", company: "Test Name", price: 10.00),
    Medicine(id: "11", name: "Trimethoprim-Sulfamethoxazole", image: "m5",company: "Test Name", price: 34.98),
    Medicine(id: "12", name: "Atorvastatin Calcium", image: "m1",company: "Test Name", price: 02.00),
    Medicine(id: "13", name: "Levofloxacin Hemihydrate", image: "m3",company: "Test Name", price: 12.80),
    Medicine(id: "14", name: "Ceftriaxone Sodium", image: "m4",company: "Test Name", price: 24.99),
    Medicine(id: "15", name: "Fluconazole Capsules", image: "m5",company: "Test Name", price: 20.90),
  
]
