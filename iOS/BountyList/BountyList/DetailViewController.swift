//
//  DetailViewController.swift
//  BountyList
//
//  Created by JINJOO on 2021/02/09.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    // 데이터에 필요한 프로퍼티 추가
    var name: String?
    var bounty: Int?

    // 화면에 띄우기 직전에 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // UI 업데이트
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }

    // close 버튼 누르면 창 닫기
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
