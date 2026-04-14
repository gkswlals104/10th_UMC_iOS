//
//  Date.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//

import Foundation

// Date 객체에서 요일과 날짜만 깔끔하게 뽑아주는 기능
extension Date {
    var dayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d" // "22", "5" 등 일자만 출력
        return formatter.string(from: self)
    }
    
    var weekdayString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 요일로 설정
        formatter.dateFormat = "E" // "월", "화" 등 요일만 출력
        return formatter.string(from: self)
    }
}
