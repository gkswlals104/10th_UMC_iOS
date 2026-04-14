//
//  MovieSearchViewModel.swift
//  MegaBoxApp
//
//  Created by 한지민 on 4/6/26.
//

import Foundation
import Combine

final class MovieSearchViewModel: ObservableObject {
    @Published var query: String = ""
    
    @Published var results: [String] = [
        "왕과 사는 남자",
        "프로젝트 헤일메리",
        "호퍼스",
        "휴민트",
        "매드 댄스 오피스",
        "메소드 연기",
        "28년 후"
    ]
    
    let movieTitles: [String] = [
        "왕과 사는 남자",
        "프로젝트 헤일메리",
        "호퍼스",
        "휴민트",
        "매드 댄스 오피스",
        "메소드 연기",
        "28년 후"
    ]
    
    let movieImages: [String] = [
        "kings",
        "hail",
        "hoppers",
        "humint",
        "madDance",
        "method",
        "years"
    ]
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        $query
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                
                if text.isEmpty {
                    self.results = self.movieTitles
                } else {
                    self.results = self.movieTitles.filter {
                        $0.contains(text)
                    }
                }
            }
            .store(in: &bag)
    }
}
