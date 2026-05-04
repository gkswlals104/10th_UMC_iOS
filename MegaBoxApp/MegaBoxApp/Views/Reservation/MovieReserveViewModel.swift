//
//  MovieReserveViewModel.swift
//  MegaBoxApp
//
//  Created by 한지민 on 4/6/26.
//

import Foundation
import Combine

final class MovieReserveViewModel: ObservableObject {
    
    //MARK: 상영 스케줄
    @Published var movieSchedules: [MovieScheduleModel] = []
    @Published var isLoading: Bool = false
    
    
    @Published var selectedMovieIndex: Int? = nil
    @Published var selectedTheaters: [String] = []
    @Published var selectedDateIndex: Int? = nil

    @Published var isTheaterEnabled: Bool = false
    @Published var isDateEnabled: Bool = false
    @Published var showSchedule: Bool = false
    
    //MARK: JSON 불러오기
    func loadMovieSchedules() async {
            await MainActor.run {
                self.isLoading = true
            }
            
            // Bundle에서 JSON 파일 경로 찾기
            guard let url = Bundle.main.url(forResource: "MovieSchedule", withExtension: "json") else {
                print("MovieSchedule.json 파일을 찾을 수 없습니다.")
                await MainActor.run { self.isLoading = false }
                return
            }

            do {
                // Data 읽어오기
                let data = try Data(contentsOf: url)
                
                // JSON 디코딩 (JSON -> DTO)
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieScheduleResponseDTO.self, from: data)
                
                // 메인 스레드에서 프로퍼티 업데이트 (DTO -> Model 변환)
                await MainActor.run {
                    self.movieSchedules = response.data.movies.map { $0.toDomain() }
                    self.isLoading = false
                    print("✅ 상영 정보 \(self.movieSchedules.count)개 로드 완료!")
                }
            } catch {
                print("디코딩 에러 상세:", error)
                await MainActor.run { self.isLoading = false }
            }
        }

    private var bag = Set<AnyCancellable>()

    let calendar = Calendar.current
    let today = Date()

    init() {
        $selectedMovieIndex
            .sink { [weak self] movieIndex in
                guard let self = self else { return }
                self.isTheaterEnabled = movieIndex != nil
                if movieIndex == nil {
                    self.selectedTheaters = []
                    self.selectedDateIndex = nil
                    self.isDateEnabled = false
                    self.showSchedule = false
                }
            }
            .store(in: &bag)

        $selectedTheaters
            .sink { [weak self] theaters in
                guard let self = self else { return }
                self.isDateEnabled = !theaters.isEmpty
                if theaters.isEmpty {
                    self.selectedDateIndex = nil
                    self.showSchedule = false
                }
            }
            .store(in: &bag)

        $selectedDateIndex
            .sink { [weak self] dateIndex in
                guard let self = self else { return }
                self.showSchedule =
                    self.selectedMovieIndex != nil &&
                    !self.selectedTheaters.isEmpty &&
                    dateIndex != nil
            }
            .store(in: &bag)
        }
    // MARK: 화면에 보여줄 필터링된 데이터
        var filteredAreas: [AreaModel] {
            // 1. 필수 조건들이 모두 선택되었는지 확인
            guard let movieIndex = selectedMovieIndex,
                  let dateIndex = selectedDateIndex,
                  !selectedTheaters.isEmpty,
                  showSchedule else {
                return []
            }
            
            // 2. 선택된 영화 인덱스가 유효한지 확인하고 가져오기
            guard movieSchedules.indices.contains(movieIndex) else { return [] }
            let selectedMovie = movieSchedules[movieIndex]
            
            // 3. 선택된 날짜 인덱스가 유효한지 확인하고 가져오기
            guard selectedMovie.schedules.indices.contains(dateIndex) else { return [] }
            let selectedSchedule = selectedMovie.schedules[dateIndex]
            
            // 4. 해당 날짜의 스케줄 중, 유저가 선택한 극장(예: "강남", "홍대")만 걸러서 반환
            let filtered = selectedSchedule.areas.filter { area in
                selectedTheaters.contains(area.areaName)
            }
            
            return filtered
        }
    }
