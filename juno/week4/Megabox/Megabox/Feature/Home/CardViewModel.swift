//
//  CardViewModel.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//

import Foundation
import Observation

enum MovieTab{
    case chart
    case upcoming
}

@Observable
class CardViewModel {
    var selectedTab: MovieTab = .chart //홈뷰 탭 전환
    
    //MovieService라는 데이터 창고 생성
    var chartMovies: [MovieInfoModel] {
        MovieService.shared.chartMovies
    }
   
        
    var upcomingMovies: [MovieInfoModel] {
        MovieService.shared.upcomingMovies
    }
    
    var currentMovies: [MovieInfoModel] {
        switch selectedTab{
        case .chart:
            return chartMovies
        case .upcoming:
            return upcomingMovies
        }
    }
}
