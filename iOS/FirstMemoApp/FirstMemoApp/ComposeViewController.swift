//
//  ComposeViewController.swift
//  FirstMemoApp
//
//  Created by JINJOO on 2021/02/02.
//

import UIKit

class ComposeViewController: UIViewController {
    
    // Cancel 버튼 구현
    @IBAction func close(_ sender: Any) {
        // 이전 화면으로 전환하는 메서드 (화면 닫기)
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
