//
//  TheaterModel.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//

import Foundation

struct TheaterModel : Identifiable, Hashable{
    let id = UUID()
    var logoImg: String
    var theaterImg: String
    var theaterTitle: String
    var theaterDesc: String
}
