//
//  UIViewController+Alert.swift
//  FirstMemoApp
//
//  Created by JINJOO on 2021/02/02.
//

// UIKit : iOS 어플리케이션 사용자 인터페이스를 구현하고 이벤트를 관리하는 프레임워크
import UIKit

// UIViewController를 상속하는 모든 클래스에서 내가 구현한 메서드를 사용할 수 있도록 extension 추가
extension UIViewController {
    // 경고창 제목과 메세지를 받는 메서드 선언
    func alert(title: String = "알림", message: String) {
        // 경고창 표시를 위해 UIAlertController 사용
        // title: 경고창 제목, message: 경고창 메세지, preferredStyle: 경고창 스타일
        // 여기선 파라미터로 전달된 값을 그대로 전달해주자!
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // 경고창에 표시되는 버튼 생성을 위해 UIAlertAction 사용
        // title: 버튼 제목, style: 버튼 스타일, handler: 버튼을 탭했을 때 실행할 코드
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        // 생성한 버튼을 UIAlertController에 추가
        alert.addAction(okAction)
        
        // present 메서드를 이용해 경고창을 화면에 표시
        present(alert, animated: true, completion: nil)
    }
}

