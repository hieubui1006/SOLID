//
//  InterfaceSegregationPrinciple.swift
//  SOLID
//
//  Created by mrhb on 10/12/2023.
//

import Foundation


/*
 - InterfaceSegregationPrinciple: <Nguyên tắc phân chia giao diện> -> Nguyên tắc là :
 ->  khách hàng không nên bị buộc phải triển khai các giao diện mà họ không sử dụng.
 -> Thay vì một giao diện dày đặc, nhiều giao diện nhỏ được ưu tiên dựa trên các nhóm phương thức, mỗi giao diện phục vụ một mô hình con.
 */

protocol TapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}


class SuperAction: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        // Single tap operation
    }
    
    func didDoubleTap() {
        // double tap operation
    }
    
    func didLongPress() {
        // long press operation
    }
}

class DoubleTapAction: DoubleTapProtocol {
    func didDoubleTap() {
        // double tap operation
    }
}
