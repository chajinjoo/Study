//
//  DetailViewController.swift
//  FirstMemoApp
//
//  Created by JINJOO on 2021/02/03.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 이전 화면에서 전달한 메모를 저장할 속성 추가
    // ViewController가 초기화되는 시점에는 값이 없으니까 옵셔널로 선언
    var memo: Memo?
    
    // DateFormatter형의 formatter 상수 프로퍼티를 클로저로 초기화함
    // 생성과 동시에 여러 프로퍼티를 초기화 할 때 클로저가 편함
    let formatter: DateFormatter = {
        // f 인스턴스 생성
        let f = DateFormatter()
        // 날짜, 시간 스타일 설정
        f.dateStyle = .long
        f.timeStyle = .short
        // 한국어 설정
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()

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

extension DetailViewController: UITableViewDataSource {
    // 테이블뷰에 표시할 셀의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // 테이블뷰에 표시할 셀
    // 두번째 파라미터인 IndexPath로 셀 위치를 파악
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        // 첫번째 셀 (메모 표시)
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            
            return cell
        // 두번째 셀 (날짜 표시)
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            
            // 여기선 옵셔널 값을 전달할 수 없으니 옵셔널 바인딩을 쓰거나 string(for: ) 메서드를 사용함
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            
            return cell
        default:
            fatalError()
        }
    }
    
    
}
