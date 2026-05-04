//
//  MovieReserveView.swift
//  MegaBoxApp
//
//  Created by 한지민 on 4/6/26.
//

import SwiftUI

struct MovieReserveView: View {
    
    @StateObject private var vm = MovieReserveViewModel()
    @State private var isShowMovieSearch: Bool = false

    let movieTitles: [String] = [
        "왕과 사는 남자",
        "프로젝트 헤일메리",
        "호퍼스",
        "휴민트",
        "매드 댄스 오피스",
        "메소드 연기",
        "뼈의 사원"
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

    let theaters: [String] = ["강남", "홍대", "신촌"]

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.mainPurple)
                    .frame(height: 125)

                Text("영화별 예매")
                    .foregroundStyle(.white)
                    .padding(.top, 85)
                    .font(.pretendard(.bold, size: 22))
            }

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {

                    // 선택된 영화 제목
                    HStack {
                        Text(vm.selectedMovieIndex == nil ? "" : movieTitles[vm.selectedMovieIndex!])
                        Spacer()
                        Button {
                            isShowMovieSearch = true
                        }
                        label: {
                            Text("전체영화")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 9)
                                
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Capsule())
                                .foregroundStyle(Color.black)
                        }
                    }
                    //MARK: 영화 선택
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(movieImages.indices, id: \.self) { index in
                                Button {
                                    vm.selectedMovieIndex = index
                                } label: {
                                    Image(movieImages[index])
                                        .resizable()
                                        .frame(width: 56, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(
                                                    vm.selectedMovieIndex == index ? Color.mainPurple : Color.clear,
                                                    lineWidth: 2
                                                )
                                        }
                                }
                                .frame(width: 63, height: 89)
                            }
                        }
                        .padding(.top, 19.15)
                    }
                    
                    //MARK: 극장 선택
                    HStack(spacing: 8) {
                        ForEach(theaters, id: \.self) { theater in
                            Button {
                                if vm.selectedTheaters.contains(theater) {
                                    vm.selectedTheaters.removeAll { $0 == theater }
                                } else {
                                    vm.selectedTheaters.append(theater)
                                }
                            } label: {
                                Text(theater)
                                    .foregroundStyle(vm.selectedTheaters.contains(theater) ? .white : .black)
                                    .frame(width: 55, height: 35)
                                    .background(vm.selectedTheaters.contains(theater) ? Color.mainPurple : Color.gray.opacity(0.2))
                                    .clipShape(Capsule())
                            }
                            .disabled(!vm.isTheaterEnabled)
                            .opacity(vm.isTheaterEnabled ? 1.0 : 0.5)
                        }
                        .padding(.top, 28)
                        .padding(.bottom, 29)
                    }

                    //MARK: 날짜 선택
                    HStack(spacing: 0) {
                        ForEach(0..<7, id: \.self) { index in
                            Button {
                                vm.selectedDateIndex = index
                            } label: {
                                VStack(spacing: 5) {

                                    // 날짜 숫자
                                    Text({
                                        let cal = Calendar.current
                                        let today = Date()
                                        let date = cal.date(byAdding: .day, value: index, to: today)!
                                        let day = cal.component(.day, from: date)
                                        return "\(day)"
                                    }())
                                    .foregroundStyle(
                                        vm.selectedDateIndex == index ? .white :
                                        ({
                                            let cal = Calendar.current
                                            let today = Date()
                                            let date = cal.date(byAdding: .day, value: index, to: today)!
                                            let w = cal.component(.weekday, from: date)
                                            if w == 1 { return Color.red }
                                            else if w == 7 { return Color.cyan }
                                            else { return Color.black }
                                        }())
                                    )

                                    // 오늘/내일/요일
                                    Text({
                                        if index == 0 { return "오늘" }
                                        if index == 1 { return "내일" }
                                        let formatter = DateFormatter()
                                        formatter.locale = Locale(identifier: "ko_KR")
                                        formatter.dateFormat = "E"
                                        let cal = Calendar.current
                                        let today = Date()
                                        let date = cal.date(byAdding: .day, value: index, to: today)!
                                        return formatter.string(from: date)
                                    }())
                                    .foregroundStyle(vm.selectedDateIndex == index ? .white : .gray)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(vm.selectedDateIndex == index ? Color.mainPurple : Color.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            .disabled(!vm.isDateEnabled)
                            .opacity(vm.isDateEnabled ? 1.0 : 0.5)
                        }
                    }
                    //MARK: 상영관
                                if vm.showSchedule {
                                    if vm.filteredAreas.isEmpty {
                                        Text("선택한 조건에 맞는 상영시간표가 없습니다.")
                                            .foregroundStyle(.gray)
                                            .padding(.top, 50)
                                    } else {
                                        // 1. 선택된 극장(Area) 반복 (예: 강남, 코엑스)
                                        ForEach(vm.filteredAreas, id: \.areaName) { area in
                                            VStack(alignment: .leading, spacing: 12) {
                                                
                                                // 극장 지점명
                                                Text(area.areaName)
                                                    .padding(.top, 49)
                                                    .font(.pretendard(.bold, size: 18))
                                                    .padding(.bottom, 21)
                                                
                                                // 2. 해당 극장의 상영관(Theater) 반복 (예: 1관, 르 리클라이너관)
                                                ForEach(area.theaters) { theater in
                                                    HStack {
                                                        Text(theater.auditorium)
                                                            .font(.pretendard(.bold, size: 18))
                                                        Spacer()
                                                        Text(theater.format) // 예: 2D
                                                            .font(.pretendard(.semi, size: 14))
                                                            .padding(.bottom, 21)
                                                    }
                                                    
                                                    // 3. 상영관의 시간표(Showtime) 반복
                                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 4), spacing: 8) {
                                                        ForEach(theater.showtimes) { showtime in
                                                            VStack(alignment: .leading) {
                                                                Text(showtime.startTime)
                                                                    .font(.pretendard(.bold, size: 18))
                                                                Text("~\(showtime.endTime)")
                                                                    // .gray03 같은 커스텀 컬러는 프로젝트 설정에 맞게 수정하세요
                                                                    .foregroundStyle(Color.gray)
                                                                    .font(.pretendard(.regular, size: 12))
                                                                Text("\(showtime.availableSeats) / \(showtime.totalSeats)")
                                                                    // .mainPurple 같은 커스텀 컬러는 프로젝트 설정에 맞게 수정하세요
                                                                    .foregroundStyle(Color.purple)
                                                                    .font(.pretendard(.semi, size: 14))
                                                            }
                                                            .padding(8)
                                                            .overlay { RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)) }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $isShowMovieSearch) {
            MovieSearchView(
                selectedMovieIndex: $vm.selectedMovieIndex,
                isShowMovieSearch: $isShowMovieSearch
            )
        }
        .task {
            await vm.loadMovieSchedules()
        }
    }
}

#Preview {
    MovieReserveView()
}
