//
//  Model.swift
//  FirstMemoApp
//
//  Created by JINJOO on 2021/02/01.
//

import Foundation

// 메모 처리를 위한 클래스
class Memo {
    var content: String // 메모 내용
    var insertDate: Date // 메모 추가한 날짜
    
    // 생성자
    init(content: String) {
        self.content = content // 초기화
        insertDate = Date() // 현재 날짜를 바로 저장하니까 별도의 파라미터를 받을 필요없음
    }
    
    // 테이블 뷰에 표시할 더미 데이터 배열
    static var dummyMemoList = [
        Memo(content: "스위프트 문법 공부하기 🤯"),
        Memo(content: "Memo 앱 만들기 👩🏻‍💻"),
    ]
}
