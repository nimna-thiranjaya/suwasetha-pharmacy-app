//
//  OrderPage.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-14.
//

import SwiftUI

struct OrderPage: View {
    @State private var ordernum = 0
    @State private var showAddOrderView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Order Status", selection: $ordernum) {
                        Text("Pending Orders").tag(0)
                        Text("Confirm Orders").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                if(ordernum == 0) {
                    PendingOrders()
                    Spacer()
                }else {
                    ConfirmOrders()
                    Spacer()
                }
            }
            .navigationTitle("Order")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showAddOrderView.toggle()
                    } label :{
                        Label("Add Food", systemImage: "plus.circle")
                            .foregroundColor(CustomColor.darkPink)
                    }
                }
            }
                .sheet(isPresented: $showAddOrderView) {
                    AddOrderPage()
            }
        }
   
    }
}

struct OrderPage_Previews: PreviewProvider {
    static var previews: some View {
        OrderPage()
    }
}


struct PendingOrders : View {
    @State private var orders: [Order] = []
    let orderController = OrderContoller()

    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss

    func fetchData() {
        orders = orderController.getData(orderStatus: "Pending")
    }
    @State private var showOrder = false
    var body:some View {
        VStack{
            List{
                ForEach(orders, id: \.id) { order in
                    ZStack{
                        NavigationLink(destination: ShowOder(order: order)) {
                            EmptyView()
                        }.opacity(0.0)
                        OrderCard(order: order)

                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                }
                .onDelete(perform: deleteOrder)
                .padding(.bottom, 5)
                
            }
            .listStyle(PlainListStyle())
     

        }.onAppear {
            fetchData()
        }

    }
    //delete
    private func deleteOrder(offsets: IndexSet){
          withAnimation {
              let data = offsets.map { orders[$0] }
              orderController.deleteOrder(order: data[0])
           }
       }
}

struct ConfirmOrders : View {
    @State private var orders: [Order] = []
    let orderController = OrderContoller()
    
    func fetchData() {
        orders = orderController.getData(orderStatus: "Completed")
    }

    var body:some View {
        VStack{
            List{
                ForEach(orders, id: \.id) { order in
              
                        OrderCard(order: order)

                }
                .padding(.bottom, 5)
                
            }
            .listStyle(PlainListStyle())
     

        }.onAppear {
            fetchData()
        }

    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}



