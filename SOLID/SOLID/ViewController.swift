//
//  ViewController.swift
//  SOLID
//
//  Created by mrhb on 10/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let log = Logger()
        print(log.printData())
    }


}

