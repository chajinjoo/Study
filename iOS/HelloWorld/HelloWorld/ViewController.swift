//
//  ViewController.swift
//  HelloWorld
//
//  Created by JINJOO on 2021/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func updateLabel(_ sender: Any) {
        label.text = "Hell, iOS!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

