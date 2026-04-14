//
//  ScreenData.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//

import Foundation

struct ScreenData: Identifiable {
    let id = UUID()
    let screenName: String
    let movieFormat: String
    let showtimes: [TimeData]
}
