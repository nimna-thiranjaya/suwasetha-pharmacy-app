//
//  HomePage.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-14.
//

import SwiftUI

struct HomePage: View {
    @State private var searchKey = ""
    @State private var tempMedicinc : [Medicine] = medicines
    
    
    func onSearch(key : String) {
        if key == ""{
            tempMedicinc = medicines
        }else{
            tempMedicinc = medicines.filter{
                $0.name.lowercased().contains(key.lowercased())
            }
        }
        
    }
    
    var body: some View {
       
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment:.leading){
                        Text("Hi, Nimna")
                            .font(.largeTitle)
                            .foregroundColor(CustomColor.darkPink)
                            .bold()
                        Text("How are you feeling today?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .bold()
                    }
                    Spacer()
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                        
                }
                .padding(.leading)
                .padding(.trailing)
                
                //For Search
                HStack{
                    TextField("Search..", text: $searchKey)
                        .onChange(of: searchKey) { newValue in
                            onSearch(key : searchKey)
                                    }
                        .padding(10)
                        .border(CustomColor.litePink, width: 4)
                        .cornerRadius(6)
                }
                .padding()
                
                VStack(alignment: .leading){
                    Text("Health Needs")
                        .font(.headline)
                        .bold()
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 15){
                            ScrollViewBtn(icon: "person.fill.badge.plus", text: "Apoinment", function: {})
                            ScrollViewBtn(icon: "stethoscope", text: "Check Ups", function: {})
                    ScrollViewBtn(icon: "cross.case", text: "Medicines", function: {})
                            ScrollViewBtn(icon: "bed.double", text: "Hospitals", function: {})
                            ScrollViewBtn(icon: "dumbbell", text: "Fitness", function: {})
                            ScrollViewBtn(icon: "rectangle.grid.2x2", text: "More", function: {})
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                }
                .padding(.leading)
                .padding(.trailing)
                
                VStack(alignment: .leading){
                    Text("Medicines")
                        .font(.headline)
                        .bold()


                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
            }
            
            
            List{
//                VStack(alignment: .leading){
//                    Text("Medicines")
//                        .font(.title)
//                        .bold()
//                    
//                    
//                }
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 4) {
                    ForEach(tempMedicinc, id: \.id) { medicine in
                        MedicineCard(medicine: medicine)
                    }
                    .padding(.top, 12)
                }
                .padding(.horizontal, 4)
            }
            .scrollIndicators(.hidden)
            .listStyle(PlainListStyle())


        }

    }
    
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

