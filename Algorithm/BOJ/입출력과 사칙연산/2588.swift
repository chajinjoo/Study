//
//  2588.swift
//  Algorithm
//
//  Created by JINJOO on 2021/03/04.
//

import Foundation

let fir = Int(readLine()!)!
let sec = Int(readLine()!)!

let a = fir * (sec % 10)
let b = fir * ((sec % 100) / 10)
let c = fir * (sec / 100)
let d = fir * sec

print(a)
print(b)
print(c)
print(d)
