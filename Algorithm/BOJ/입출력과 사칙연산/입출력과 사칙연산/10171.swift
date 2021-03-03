//
//  10171.swift
//  입출력과 사칙연산
//
//  Created by JINJOO on 2021/03/04.
//

// 확장된 문자열 구분 문자(Extended String Delimiters) 사용
// 특수 문자 효과를 사라지게 함.
// # hashtag 안에 문자열, 여러 줄 문자열을 넣어줌

// 줄바꿈은 """ Multiline String Literal 사용

import Foundation

let cat = #"""
\    /\
 )  ( ')
(  /  )
 \(__)|
"""#

print(cat)
