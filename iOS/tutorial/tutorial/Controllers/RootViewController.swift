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
        label.text = "Hello World"
        return label
    }()
    
    // MARK: Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponent()
    }
    
    // MARK: Configures
    func configureViewComponent() {
        self.view.backgroundColor = .systemBackground
    }
}
