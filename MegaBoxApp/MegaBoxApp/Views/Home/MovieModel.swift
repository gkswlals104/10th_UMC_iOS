//
//  MovieModel.swift
//  MegaBoxApp
//
//  Created by 한지민 on 3/30/26.
//

import Foundation

struct MovieModel: Identifiable {
    let id: UUID = UUID()
    let title: String
    let englishTitle: String
    let audience: String
    let cardImageName: String
    let detailImageName: String
    let description: String
    let age: String
    let openInfo: String
    let genre: String
    let type: String
    let director: String
    let cast: String
}
