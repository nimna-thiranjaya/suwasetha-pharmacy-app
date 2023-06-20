//
//  Order+CoreDataProperties.swift
//  Suwasetha-Pharmacy
//
//  Created by Nimna  on 2023-06-16.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var patientName: String?
    @NSManaged public var patientDob: Date?
    @NSManaged public var gender: String?
    @NSManaged public var address: String?
    @NSManaged public var prescription: Data?
    @NSManaged public var duration: Int16
    @NSManaged public var orderStatus: String?
    @NSManaged public var id: UUID?

}

extension Order : Identifiable {

}
