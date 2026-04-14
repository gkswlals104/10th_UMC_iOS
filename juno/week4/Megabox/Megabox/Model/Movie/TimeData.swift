//
//  TimeData.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//

import Foundation

struct TimeData: Identifiable {
    let id = UUID()
    let startTime: String
    let endTime: String
    let availableSeats: Int
    let totalSeats: Int
}
