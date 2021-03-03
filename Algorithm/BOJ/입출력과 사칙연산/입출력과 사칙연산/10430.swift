//
//  10430.swift
//  입출력과 사칙연산
//
//  Created by JINJOO on 2021/03/04.
//

import Foundation

let input = readLine()!.split(separator: " ")

let a = Int(input[0])!
let b = Int(input[1])!
let c = Int(input[2])!

print((a + b) % c)
print(((a % c) + (b % c)) % c)
print((a * b) % c)
print(((a % c) * (b % c)) % c)
