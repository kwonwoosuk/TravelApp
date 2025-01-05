//
//  ShoppingList.swift
//  TravelApp
//
//  Created by 권우석 on 1/3/25.
//

import Foundation

struct Shopping {
    let name: String
    var star: Bool = false
    var check: Bool = false
}

struct ShoppingInfo {
    let list: [Shopping] = [
        Shopping(name: "그립톡 구매하기"),
        Shopping(name: "사이다 구매"),
        Shopping(name: "아이패드케이스 최저가 알아보기"),
        Shopping(name: "양말")        
    ]
        
    
}

