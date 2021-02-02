//
//  MemoListTableViewController.swift
//  FirstMemoApp
//
//  Created by JINJOO on 2021/02/01.
//

import UIKit

class MemoListTableViewController: UITableViewController {
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
    
    // viewWillAppear 테이블뷰를 업데이트 해주는 메서드
    // ViewController가 관리하는 뷰가 화면에 표시되기 직전에 자동으로 호출됨
    // 여기서 테이블뷰에게 "목록을 업데이트 해!!" 라고 알려주면 됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        // reloadData() 메서드만 호출하면 데이터소스가 전달해주는 최신 데이터로 업데이트함
//        tableView.reloadData()
//        // viewWillAppear 메서드가 실제로 호출됐나 확인하는 로그 추가
//        print(#function)
    }

    // 토큰을 저장하는 속성 추가
    var token: NSObjectProtocol?
    
    // 소멸자에서 옵저버를 해제하자
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    // ViewController가 생성된 후, 자동으로 호출됨!
    // *주로 1번만 실행하는 초기화 코드를 여기서 구현함
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification 구현시, 옵저버를 해제하는 것이 젤 중요!(메모리 낭비 방지)
        // 하단에 addObserver 메서드는 옵저버를 해제할 때 사용하는 객체를 리턴함(토큰이라 부름)
        // addObserver가 리턴하는 토큰을 token 속성에 저장함
        // viewDidLoad에서 추가한 옵저버는 뷰가 화면에서 사라지기 전에 해제하거나, 소멸자에서 해제함
        
        // 옵저버를 추가하는 코드는 1번만 실행하면 되니까 여기서 구현함
        // forName: 옵저버를 추가할 Notification의 이름
        // object: 특별한 이유 없다면 대부분 nil을 전달
        // 중요!! Notification이 전달되면 테이블뷰를 업데이트 해야함(UI 업데이트)
        // UI 업데이트는 반드시 "메인 쓰레드"에서 실행해야함!
        // iOS에서는 쓰레드를 직접 처리하지 않고, DispatchQueue나 OperationQueue를 통해서 처리함
        // queue: OperationQueue.main << 요래하면 옵저버가 실행하는 코드가 메인 쓰레드에서 실행됨!
        // using: (Notification) -> Void >> 클로저를 전달
        // Notification이 전달되면 using 파라미터에 전달한 클로저가
        // queue 파라미터로 전달한 쓰레드에서 실행됨
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData() // 테이블뷰를 리로드
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    // 필수 구현 메서드
    // numberOfRowsInSection : 테이블뷰의 섹션에 있는 행의 갯수를 리턴
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count // dummyMemoList 배열의 갯수를 리턴
    }

    // 가장 중요한 메서드
    // 이 메서드에서 셀을 가져온 후, 실제 데이터를 채워서 리턴
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "reuseIdentifier" -> 내가 테이블뷰 섹션 Identifier에 지정한 "cell" 로 변경
        // cell 상수에 내가 Main.storyboard에 구성한 프로토타입 cell이 생성되어서 저장됨
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        // cell을 리턴하기 전에 메모와 날짜를 출력
        // indexPath[section, row]로 이뤄진 테이블뷰의 행을 식별하는 상대적인 인덱스 경로
        let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content
        // formatter에서 string(from: ) 메서드를 호출하고 해당 날짜를 전달하면,
        // 위에서 지정한 스타일로 포메팅해서 문자열로 리턴해줌
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
