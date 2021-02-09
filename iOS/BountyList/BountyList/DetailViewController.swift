//
//  DetailViewController.swift
//  BountyList
//
//  Created by JINJOO on 2021/02/09.
//

import UIKit

class DetailViewController: UIViewController {
    // MVVM
    
    // Model
    // BountyInfo 만들기
    
    // View
    // imgView, nameLabel, bountyLabel
    // view들은 viewModel을 통해서 구성되기
    
    // ViewModel
    // DetailViewModel을 만들고 뷰레이어에서 필요한 메서드 만들기
    // 모델 갖고있기, BountyInfo들...
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    // 데이터에 필요한 프로퍼티 추가
    let viewModel = DetailViewModel()

    // 화면에 띄우기 직전에 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // UI 업데이트
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }

    // close 버튼 누르면 창 닫기
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
