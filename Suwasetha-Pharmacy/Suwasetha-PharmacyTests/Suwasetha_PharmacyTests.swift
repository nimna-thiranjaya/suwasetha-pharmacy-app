import XCTest
import CoreData
@testable import Suwasetha_Pharmacy // Assuming this is the correct import statement for your project

class OrderControllerTests: XCTestCase {
    var orderController: OrderContoller!
    override func setUp() {
        super.setUp()
        orderController = OrderContoller()
    }
    
    override func tearDown() {
        super.tearDown()
        orderController = nil
    }
    
    func testAddOrder() {
        let context = orderController.container.viewContext
        
        let initialCount = orderController.getData(orderStatus: "Pending").count
        
        orderController.addOrder(patientName: "John Doe", patientDob: Date(), gender: "Male", address: "123 Main St", prescription: Data(), duration: 7, context: context)
        
        let finalCount = orderController.getData(orderStatus: "Pending").count
        
        XCTAssertEqual(finalCount, initialCount + 1, "Order count should increase by 1 after adding an order")
    }
    
    func testEditOrder() {
        let context = orderController.container.viewContext
        
        let order = Order(context: context)
        order.patientName = "Jane Smith"
        order.patientDob = Date()
        order.gender = "Female"
        order.address = "456 Elm St"
        order.prescription = Data()
        order.duration = 10
        
        orderController.editOrder(order: order, patientName: "New Name", patientDob: Date(), gender: "Male", address: "New Address", prescription: Data(), duration: 5)
        
        XCTAssertEqual(order.patientName, "New Name", "Order's patient name should be updated")
        XCTAssertEqual(order.duration, 5, "Order's duration should be updated")
    }
    
    func testDeleteOrder() {
        let context = orderController.container.viewContext
        
        let order = Order(context: context)
        
        let initialCount = orderController.getData(orderStatus: "Pending").count
        
        let allpendingOrders = orderController.getData(orderStatus: "Pending")
        
        if let lastElement = allpendingOrders.last {
            orderController.deleteOrder(order: lastElement)
        }
                
        let finalCount = orderController.getData(orderStatus: "Pending").count
        
        XCTAssertEqual(finalCount, initialCount - 1, "Order count should decrease by 1 after deleting an order")
    }
    
    func testMarkOrderAsCompleted() {
        let context = orderController.container.viewContext
        
        let order = Order(context: context)
        
        orderController.markOrderAsCompleted(order: order)
        
        XCTAssertEqual(order.orderStatus, "Completed", "Order's status should be marked as 'Completed'")
    }
    
}
