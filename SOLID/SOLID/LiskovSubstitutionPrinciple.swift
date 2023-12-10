//
//  LiskovSubstitutionPrinciple.swift
//  SOLID
//
//  Created by mrhb on 10/12/2023.
//

import Foundation

/*
 - LiskovSubstitutionPrinciple <Nguyên tắc thay thế Liskov>:
 -> Nguyên tắc này có thể giúp bạn sử dụng tính kế thừa mà không làm hỏng nó.
 */

struct PreferenceKey {
    static let requestKey: String = "NSURLRequestKey"
}

/// Lớp con NSError cung cấp chức năng bổ sung nhưng không gây rối với lớp gốc. NSError
class RequestError: NSError {
    var request: NSURLRequest? {
        return userInfo[PreferenceKey.requestKey] as? NSURLRequest
    }
}



class HandleAPIError {
    
    init() {
        let result = willReturnObjectOrError()
        //RequestError
        if let requestError = result.error as? RequestError {
            requestError.request
        }
    }
    
    func fetchData(_ request: NSURLRequest) -> (data: NSData?, error: NSError?) {
        let userInfo: [String:Any] = [PreferenceKey.requestKey: request]
        return(nil, RequestError(domain: "DOMAIN", code: 0, userInfo: userInfo))
    }
    
    func willReturnObjectOrError() -> (object: AnyObject?, error: NSError?) {
        let request = NSURLRequest()
        let result = fetchData(request)
        return (result.data, result.error)
    }
}
