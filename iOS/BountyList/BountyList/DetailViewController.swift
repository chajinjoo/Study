//
//  DetailViewController.swift
//  BountyList
//
//  Created by JINJOO on 2021/02/09.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // close 버튼 누르면 창 닫기
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
