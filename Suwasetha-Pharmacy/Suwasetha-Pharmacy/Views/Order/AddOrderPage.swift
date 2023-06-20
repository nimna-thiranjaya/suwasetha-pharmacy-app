////
////  AddOrderPage.swift
////  Suwasetha-Pharmacy
////
////  Created by Nimna  on 2023-06-15.
////
//
//import SwiftUI
//import PhotosUI
//
//struct AddOrderPage: View {
//    @State public var patientName = ""
//    @State public var patientGender = "Male"
//    @State public var duration: Double = 7.0
//    @State public var prescriptionData = ""
//    @State public var patientDob = Date()
////    @State public var prescription:Image
//    @State public var address = ""
//
//    @State private var selectedimage: Data = .init(count: 0)
//    @State private var selectedItems: [PhotosPickerItem] = []
//
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @Environment(\.dismiss) var dismiss
//
//
//    var body: some View {
//
//        NavigationStack {
//            VStack{
//                Form{
//                    Section("Patient Details"){
//                        HStack{
//                            Text("Name")
//                            TextField("Patient Name", text: $patientName)
//                        }
//
//                        HStack{
//                            Text("Date of Birth")
//                            DatePicker("Date", selection: $patientDob,displayedComponents: .date)
//
//
//                        }
//
//                        HStack{
//                            Text("Gender")
//                            Spacer()
//                            Picker("", selection: $patientGender) {
//                                Text("Male").tag("Male")
//                                Text("Female").tag("Female")
//                            }
//                            .pickerStyle(.segmented)
//
//                        }
//
//                        HStack{
//                            Text("Address")
//                            TextField("Address", text: $address)
//
//                        }
//                    }
//
//                    Section("Order Details"){
//                        VStack(alignment: .leading){
//                            Text("Prescription")
//                            HStack {
//                                Spacer()
//
//                                //MARK: PhotoPicker
//                                PhotosPicker(selection: $selectedItems,
//                                             maxSelectionCount: 1,
//                                             matching: .images) {
//                                    if !selectedimage.isEmpty, let uiImage = UIImage(data: selectedimage) {
//                                        Image(uiImage: uiImage)
//                                            .renderingMode(.original)
//                                            .resizable()
//                                            .frame(width: 100, height: 100)
//                                            .cornerRadius(8)
//                                            .shadow(radius: 5)
//                                    } else {
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .frame(width: 100, height: 100)
//                                            .cornerRadius(8)
//                                            .shadow(radius: 5)
//                                            .foregroundColor(.gray)
//                                    }
//                                }
//                                //MARK: PhotoPicker
//                                Spacer()
//                                    .onChange(of: selectedItems) { new in
//                                        guard let items = selectedItems.first else { return
//
//                                        }//MARK: items
//
//                                        items.loadTransferable(type: Data.self) { result in
//                                            switch result {
//                                            case .success(let data):
//                                                if let data = data {
//                                                    self.selectedimage = data
//                                                } else {
//                                                    print("No data :(")
//                                                }
//                                            case .failure(let error):
//                                                fatalError("\(error)")
//                                            }
//                                        }//MARK: loadTransferable
//
//                                    }//MARK: onChange
//                            }
//                        }
//
//
//                        HStack{
//                            Text("Duration")
//                            Spacer()
//                            Slider(value:$duration, in:7...60, step:10)
//                            Text("\(Int(duration)) Days")
//                        }
//                        VStack{
//                            Spacer()
//                            HStack{
//                                Spacer()
//                                Button(action: {
//                                    OrderContoller().addOrder(patientName: patientName, patientDob:patientDob, gender: patientGender, address: address, prescription: selectedimage, duration: Int16(duration), context: managedObjectContext)
//
//                                    dismiss()
//                                }) {
//                                    Text("Place Order")
//                                        .bold()
//                                }
//                                .buttonStyle(.borderedProminent)
//                                .tint(CustomColor.darkPink)
//                                Spacer()
//                            }
//                            Spacer()
//                        }
//
//                    }
//
//                }
//            }
//        }
//    }
//}
//
//struct AddOrderPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AddOrderPage()
//    }
//}
//

//
//  AddOrderPage.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-15.
//

import SwiftUI
import PhotosUI

struct AddOrderPage: View {
    @State public var patientName = ""
    @State public var patientGender = "Male"
    @State public var duration: Double = 7.0
    @State public var prescriptionData = ""
    @State public var patientDob = Date()
//    @State public var prescription:Image
    @State public var address = ""
    
    @State private var selectedimage: Data = .init(count: 0)
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    

    var body: some View {
       
        NavigationStack {
            VStack{
                HStack{
                    Text("Place Order")
                        .font(.body.bold())
                        .padding(3)
                }
                Form{
                    Section("Patient Name"){
                        TextField("Patient Name", text: $patientName)
                    }
                    
                    Section("Date of Birth"){
                        DatePicker("Date", selection: $patientDob,displayedComponents: .date)
                    }
                    
                    Section("Gender"){
                        Picker("", selection: $patientGender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(.segmented)                    }
                    
                    Section("Address"){
                        TextField("Address", text: $address)
                    }
                    

                    Section("Duration"){
                        HStack{
                            Slider(value:$duration, in:7...60, step:10)
                            Text("\(Int(duration)) Days")
                        }
                    }
                        
                    
                    Section("Prescription"){
                        VStack(alignment: .leading){
                            HStack {
                                Spacer()
                                
                                //MARK: PhotoPicker
                                PhotosPicker(selection: $selectedItems,
                                             maxSelectionCount: 1,
                                             matching: .images) {
                                    if !selectedimage.isEmpty, let uiImage = UIImage(data: selectedimage) {
                                        Image(uiImage: uiImage)
                                            .renderingMode(.original)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(8)
                                            .shadow(radius: 5)
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(8)
                                            .shadow(radius: 5)
                                            .foregroundColor(.gray)
                                    }
                                }
                                //MARK: PhotoPicker
                                Spacer()
                                    .onChange(of: selectedItems) { new in
                                        guard let items = selectedItems.first else { return
                                            
                                        }//MARK: items
                                        
                                        items.loadTransferable(type: Data.self) { result in
                                            switch result {
                                            case .success(let data):
                                                if let data = data {
                                                    self.selectedimage = data
                                                } else {
                                                    print("No data :(")
                                                }
                                            case .failure(let error):
                                                fatalError("\(error)")
                                            }
                                        }//MARK: loadTransferable
                                        
                                    }//MARK: onChange
                            }
                        }
                    }
                    
                
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Button(action: {
                                    OrderContoller().addOrder(patientName: patientName, patientDob:patientDob, gender: patientGender, address: address, prescription: selectedimage, duration: Int16(duration), context: managedObjectContext)
                                    
                                    dismiss()
                                }) {
                                    Text("Place Order")
                                        .padding(6)
                                        .bold()
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(CustomColor.darkPink)
                                Spacer()
                            }
                            Spacer()
                        }.listRowBackground(Color.clear)
                }
            }
        }
    }
}

struct AddOrderPage_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderPage()
    }
}

