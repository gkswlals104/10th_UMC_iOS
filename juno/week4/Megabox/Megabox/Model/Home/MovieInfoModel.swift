//
//  MovieInfoModel.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//

import Foundation

struct MovieInfoModel : Identifiable{
    //홈화면 데이터
    let id = UUID()
    var movieImg: String
    var movieTitle: String
    var totalAdmissions : Int
    
    //상세페이지용 데이터
    var detailImg: String = ""
    var engtitle: String = "" // 영문 제목
    var synopsis: String = "" // 줄거리
    var rating: String = "" // 12세 관람가
    var releaseDate: String = ""
    var runningTime: String = ""
    var genre: String = ""
    var format: String = ""
    var director: String = ""
    var cast: String = ""
    var userReviews: String = ""
}
