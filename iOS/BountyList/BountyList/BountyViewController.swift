//
//  BountyViewController.swift
//  BountyList
//
//  Created by JINJOO on 2021/02/08.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 더미 데이터 세팅
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    // 연결한 세그웨이를 수행하기 직전에 데이터를 넘겨주자!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 데이터 줄게!
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // UITableViewDataSource
    // 테이블뷰 셀이 몇개임?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count // 데이터의 갯수
    }
    
    // 테이블뷰 어떻게 보여줄까?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }

    // UITableViewDelegate
    // 테이블 뷰 클릭하면 어떻게 할까?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        // 연결한 세그웨이 수행해라! (DetailView 띄우기)
        // sender 파라미터에 정보를 넣어서 보냄
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}

// 커스텀 셀
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
