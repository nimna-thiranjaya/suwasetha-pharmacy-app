//
//  OrderController.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-16.
//

import Foundation
import CoreData

class OrderContoller: ObservableObject{
    let container = NSPersistentContainer(name: "OrderModel")
    
    init(){
        container.loadPersistentStores {
            desc, error in
            if let error = error {
                print("Faild to load data \(error.localizedDescription)")
            }
            
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do{
            try context.save()
            print("Data save successful!")
        }catch{
            print(error)
            print("Error in data save!")
        }
    }
    
    func addOrder(patientName: String, patientDob: Date, gender: String, address: String, prescription: Data, duration: Int16, context:NSManagedObjectContext) {
        let order = Order(context: context)

        order.id = UUID()
        order.patientName = patientName
        order.patientDob = patientDob
        order.address = address
        order.duration = duration
        order.gender = gender
        order.prescription = prescription
        order.orderStatus = "Pending"

        print(order)
        save(context: context)
    }
    
    func getData(orderStatus: String) -> [Order] {
        //create fetch request
        let fetchRequest: NSFetchRequest<Order> = Order.fetchRequest()
        //add condition to request
        let predicate = NSPredicate(format: "orderStatus == %@", orderStatus)
        let sortDescriptor = NSSortDescriptor(key: "orderStatus", ascending: true)
        
        //save data to array
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            // return result
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            return fetchedResults
        } catch {
            //Error handling
            print("Error fetching data: \(error.localizedDescription)")
            return []
        }
    }

    func editOrder(order: Order, patientName: String, patientDob: Date, gender: String, address: String, prescription: Data, duration: Int16) {
        order.patientName = patientName
        order.patientDob = patientDob
        order.gender = gender
        order.address = address
        order.prescription = prescription
        order.duration = duration
        
        save(context: order.managedObjectContext!)
    }
        
    func deleteOrder(order: Order) {
        let context = order.managedObjectContext
        context?.delete(order)
        
        save(context: context!)
        
        
    }
    
    func markOrderAsCompleted(order: Order) {
        order.orderStatus = "Completed"
        save(context: order.managedObjectContext!)
    }
}
