//
//  TicketingViewModel.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//
import Foundation
import Combine

class TicketingViewModel: ObservableObject {
    @Published var movies: [MovieInfoModel] = MovieService.shared.chartMovies
    @Published var selectedMovieId: UUID? = nil
    @Published var selectedMovie: MovieInfoModel? = nil
    
    @Published var isTheaterEnabled: Bool = false
    
    // Set집합 자료구조를 이용한 다중선택 기능
    @Published var selectedTheaters: Set<String> = []
    
    
    //시간 섹션
    @Published var availableDates: [Date] = []
    @Published var selectedDate: Date? = nil
    @Published var isDateEnabled: Bool = false
    
    // 상영 시간표 노출 여부 관련 변수
    @Published var canShowShowtimes: Bool = false // 영화, 극장, 날짜 모두 선택했는가?
    @Published var isTodaySelected: Bool = false  // 선택된 날짜가 오늘(첫째 날)인가?
    
    private var cancellables = Set<AnyCancellable>()
    
    // UI 렌더링용 임시 데이터
    let mockTheaterSchedule: [String: [ScreenData]] = [
        "강남": [
            ScreenData(screenName: "르 리클라이너 1관", movieFormat: "2D", showtimes: [
                TimeData(startTime: "11:30", endTime: "~13:58", availableSeats: 109, totalSeats: 116),
                TimeData(startTime: "14:20", endTime: "~16:48", availableSeats: 19, totalSeats: 116),
                TimeData(startTime: "17:05", endTime: "~19:28", availableSeats: 1, totalSeats: 116),
                TimeData(startTime: "19:45", endTime: "~22:02", availableSeats: 100, totalSeats: 116),
                TimeData(startTime: "22:20", endTime: "~00:04", availableSeats: 116, totalSeats: 116)
            ])
        ],
        "홍대": [
            ScreenData(screenName: "BTS관 (7층 1관 [Laser])", movieFormat: "2D", showtimes: [
                TimeData(startTime: "9:30", endTime: "~11:50", availableSeats: 75, totalSeats: 116),
                TimeData(startTime: "12:00", endTime: "~14:26", availableSeats: 102, totalSeats: 116),
                TimeData(startTime: "14:45", endTime: "~17:04", availableSeats: 88, totalSeats: 116)
            ]),
            ScreenData(screenName: "BTS관 (9층 2관 [Laser])", movieFormat: "2D", showtimes: [
                TimeData(startTime: "11:30", endTime: "~13:58", availableSeats: 34, totalSeats: 116),
                TimeData(startTime: "14:10", endTime: "~16:32", availableSeats: 100, totalSeats: 116),
                TimeData(startTime: "16:50", endTime: "~19:00", availableSeats: 13, totalSeats: 116),
                TimeData(startTime: "19:20", endTime: "~21:40", availableSeats: 92, totalSeats: 116)
            ])
        ]
    ]
    
    init() {
        self.selectedMovieId = movies.first?.id
        generateDates()
        setupBindings()
    }
    
    private func generateDates() {
        let today = Date()
        var dates: [Date] = []
        for i in 0..<7 {
            if let date = Calendar.current.date(byAdding: .day, value: i, to: today) {
                dates.append(date)
            }
        }
        self.availableDates = dates
    }
    
    private func setupBindings() {
        // 1. 영화 선택 감지
        $selectedMovieId
            .sink { [weak self] newId in
                guard let self = self else { return }
                self.isTheaterEnabled = (newId != nil)
                if let id = newId { self.selectedMovie = self.movies.first(where: { $0.id == id }) }
                self.selectedTheaters.removeAll() // 초기화
                self.selectedDate = nil
                self.checkShowtimeEligibility()
            }
            .store(in: &cancellables)
        
        // 2. 극장 선택 감지 다중 선택
        $selectedTheaters
            .sink { [weak self] theaters in
                guard let self = self else { return }
                self.isDateEnabled = !theaters.isEmpty
                
                // 극장이 모두 해제되면 날짜도 초기화
                if theaters.isEmpty { self.selectedDate = nil }
                self.checkShowtimeEligibility()
            }
            .store(in: &cancellables)
        
        // 3. 날짜 선택 감지 (오늘인지 판별)
        $selectedDate
            .sink { [weak self] date in
                guard let self = self else { return }
                if let selected = date, let today = self.availableDates.first {
                    self.isTodaySelected = Calendar.current.isDate(selected, inSameDayAs: today)
                } else {
                    self.isTodaySelected = false
                }
                self.checkShowtimeEligibility()
            }
            .store(in: &cancellables)
    }
    
    // 💡 3가지 조건이 모두 충족되었는지 검사 (Combine 연쇄 작용의 결과)
    private func checkShowtimeEligibility() {
        // 🚀 해결책: 변수에 값이 완전히 '저장된 직후'에 검사하도록 아주 잠깐(0.001초) 미룹니다!
        DispatchQueue.main.async {
            self.canShowShowtimes = (self.selectedMovieId != nil) && (!self.selectedTheaters.isEmpty) && (self.selectedDate != nil)
        }
    }
}
