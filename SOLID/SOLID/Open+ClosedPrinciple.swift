//
//  Open+ClosedPrinciple.swift
//  SOLID
//
//  Created by mrhb on 10/12/2023.
//

import UIKit

/*
 - Open for extension (Mở rộng) : -> Bạn có thể mở rộng hoặc thay đổi hành vi của một lớp mà không cần tốn effort.
 - Closed for modification (Đóng sửa đổi) -> Bạn mở rộng một lớp mà không thay đổi cách triển khai.
 */

protocol Printable {
    func printDetails() -> String
}

class Car : Printable {
    
    var name: String
    var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "Car color \(color) and name \(name)"
    }
}

class Bike: Printable {
    let name: String
    let color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "Bike color \(color) and name \(name)"
    }
}

class Logger {
    func printData() {
        let vehicles: [Printable] = [Car(name: "BMW", color: .blue),
                                     Bike(name: "SH 300i", color: .white)]
        
        vehicles.forEach { item in
            let value = item.printDetails()
            print("\(value)")
        }
    }
}
