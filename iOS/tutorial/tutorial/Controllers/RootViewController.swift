//
//  RootViewController.swift
//  tutorial
//
//  Created by JINJOO on 2021/03/16.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: Properties
    lazy var helloWorldLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    // MARK: Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
    }
}
