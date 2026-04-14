//
//  MovieSearchViewModel.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//

import Foundation
import Combine

class MovieSearchViewModel: ObservableObject {
    // 뷰의 TextField와 연결될 검색어 변수
    @Published var searchText: String = ""
    
    // 화면에 보여줄 필터링된 영화 목록
    @Published var filteredMovies: [MovieInfoModel] = []
    
    // 전체 영화 원본 데이터 (데이터 창고에서 가져옴)
    private var allMovies: [MovieInfoModel] = MovieService.shared.chartMovies
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.filteredMovies = allMovies // 처음엔 전체 영화 표시
        setupSearchPublisher()
    }
    
    private func setupSearchPublisher() {
        $searchText
            // 400ms 동안 타이핑이 멈출 때까지 기다림
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            
            //이전 값과 완전히 똑같으면 무시하고 건너뜀
            .removeDuplicates()
            
            //UI 업데이트는 무조건 메인 스레드에서 실행되도록 보장
            .receive(on: DispatchQueue.main)
            
            // 변경된 검색어를 바탕으로 영화 필터링
            .sink { [weak self] text in
                guard let self = self else { return }
                
                if text.isEmpty {
                    self.filteredMovies = self.allMovies // 검색어가 없으면 전체 표시
                } else {
                    // 대소문자, 띄어쓰기 무시하고 영화 제목 검색
                    self.filteredMovies = self.allMovies.filter {
                        $0.movieTitle.localizedStandardContains(text)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
