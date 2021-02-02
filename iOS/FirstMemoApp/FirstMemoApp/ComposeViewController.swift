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
    
    // 새 메모 화면의 텍스트 뷰
    @IBOutlet weak var memoTextView: UITextView!
    
    
    // Save 버튼 구현
    @IBAction func save(_ sender: Any) {
        // guard문을 통해 조건이 true면 guard문 다음 코드를 실행함!
        // 일단 텍스트 필드에 입력된 문자열을 상수에 저장하는데,
        // 문자열 길이를 같이 확인해서 실제로 메모를 입력한 경우에만 처리하게끔 함!
        // 조건이 false면 메모를 입력하라는 경고창을 표시 (else구문 실행)
        // memoTextView가 UITextView!형이니까 옵셔널 바인딩 이용해서 값을 언래핑
        guard let memo = memoTextView.text,
              memo.count > 0 else {
            // 경고창 표시 (구현한 메서드를 호출하자!)
            alert(message: "메모를 입력하세요")
            return
        }
        // guard문이 true면 이 코드 실행!
        // 새로운 메모 인스턴스를 생성하고 dummyMemoList 배열에 저장
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        // 새 메모 화면을 닫기 전에 Notification을 전달함
        // Notification은 앱을 구성하는 모든 객체로 전달됨 (잘못된 설명이지만 일단 큰틀은 이렇게 이해하자!)
        // 라디오 방송국에서 라디오 방송을 브로드캐스팅하는 것과 같음
        // 브로드캐스팅 : 송신 호스트가 전송한 데이터가 네트워크에 연결된 모든 호스트에 전송되는 방식을 의미
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        // 새 메모 화면 닫기
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


extension ComposeViewController {
    // Notification 이름 추가
    // 라디오 방송은 주파수로 구분하는 것처럼 Notification은 이름으로 구분
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
