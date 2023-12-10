//
//  SingleResponsibilityPrinciple.swift
//  SOLID
//
//  Created by mrhb on 10/12/2023.
//

import UIKit
/*
 - SingleResponsibilityPrinciple <Nguyên tắc trách nhiệm duy nhất> : nguyên tắc chỉ nên có 1 trách nhiệm và lý do để thay đổi.
 */

class APIHandle {
    func requestDataToAPI() -> Data {
        // Network request and wait the response
        return Data()
    }
    
}

class ParseHandler {
    func parseResponse(data: Data) -> [String] {
        // Parse the network response into array
        return []
    }
    
}

class DBHandler {
    func saveToDatabase(array: [String]) {
        // Save parsed response into database
    }
}

class Handler {
    let apiHandle: APIHandle
    let parseHandle: ParseHandler
    let dbHandle: DBHandler
    
    init(apiHandle: APIHandle, parseHandle: ParseHandler, dbHandle: DBHandler) {
        self.apiHandle = apiHandle
        self.parseHandle = parseHandle
        self.dbHandle = dbHandle
    }
    
    func handle() {
        let data = apiHandle.requestDataToAPI()
        let array = parseHandle.parseResponse(data: data)
        dbHandle.saveToDatabase(array: array)
    }
}
