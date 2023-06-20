//
//  UpdateOrder.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-16.
//

import SwiftUI
import PhotosUI

struct UpdateOrder: View {
    var order : Order
    
    @State public var patientName = ""
    @State public var patientGender = "Male"
    @State public var duration: Double = 7.0
    @State public var prescriptionData = ""
    @State public var patientDob = Date()
    @State private var selectedimage: Data
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var address : String = ""
//    @State public var prescription:Image
    @State private var id : UUID
    
    init(order: Order) {
        self.order = order
        _patientName = State(initialValue: order.patientName ?? "")
        _patientGender = State(initialValue: order.gender ?? "")
        _duration = State(initialValue: Double(order.duration))
        _patientDob = State(initialValue: (order.patientDob)!)
        _address = State(initialValue: order.address ?? "")
        _selectedimage = State(initialValue: order.prescription ?? Data(count: 0))
        _id = State(initialValue: order.id!)


    }
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Text("Update Order")
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
                        .pickerStyle(.segmented)
                    }
                    
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
                    
                    
                        
                    
 
                    HStack{
                        Spacer()
                        Button(action: {
                            OrderContoller().editOrder(order: order,patientName: patientName, patientDob:patientDob, gender: patientGender, address: address, prescription: selectedimage, duration: Int16(duration))
                            
                            dismiss()
                        }) {
                            Text("Update Order")
                                .padding(6)
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(CustomColor.darkPink)
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    
                }
            }
        }
    }
}

//struct UpdateOrder_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateOrder()
//    }
//}
