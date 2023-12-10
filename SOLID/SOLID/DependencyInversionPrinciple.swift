//
//  DependencyInversionPrinciple.swift
//  SOLID
//
//  Created by mrhb on 10/12/2023.
//

import Foundation

/*
    - DependencyInversionPrinciple: <Nguyên tắc đảo ngược phụ thuộc>
    -> Các mô-đun cấp cao 'không nên' phụ thuộc vào các mô-đun cấp thấp mà cả hai đều phải phụ thuộc vào Trừu tượng.
    -> (Sự trừu tượng không nên phụ thuộc vào chi tiết. Chi tiết nên phụ thuộc vào sự trừu tượng)
    -> Dependency Inversion Principle : giống với Open-Closed Principle <nguyên tắc đóng mở>, cách tiếp cận để sử dụng, để có một kiến ​​trúc rõ ràng, là tách rời các phần phụ thuộc. Bạn có thể thực hiện nó thành các lớp trừu tượng

 */

///============================================

/*
 - Storage : -> Chúng ta có thể giải quyết sự phụ thuộc này bằng giao thức Storage
 -> Bằng cách này, Handler có thể sử dụng giao thức trừu tượng này mà không cần quan tâm đến loại bộ nhớ được sử dụng.
 -> Với cách tiếp cận này, chúng ta có thể dễ dàng thay đổi từ hệ thống tệp sang cơ sở dữ liệu.

 */
protocol Storage {
    func save(string: String)
}


/*
 - FileSystemManager : -> Là mô-đun cấp thấp và dễ dàng sử dụng lại trong các dự án khác.
 */
class FileSystemManagers: Storage {
    func save(string: String) {
        // Open a file
        // Save the string in this file
        // Close the file
   }
}

class DatabaseManager: Storage {
    func save(string: String) {
        // Connect to the database
        // Execute the query to save the string in a table
        // Close the connection
    }
}

class Handlers {
    let storage: Storage
    // Storage types
    init(storage: Storage) {
        self.storage = storage
    }
    
    func handle(string: String) {
        storage.save(string: string)
    }
}

class StubStorage: Storage {

    var isSavedCalled = false

    func save(string: String) {
        isSavedCalled = true
    }
}

/* - Unit test
class HandlerTests: XCTestCase {

    func test_Handle_IsSaveCalled() {
        let stubStorage = StubStorage()
        let handler = Handlers(storage: stubStorage)

        handler.handle(string: "test")

        XCTAssertTrue(stubStorage.isSavedCalled)
    }
}
 */
