//
//  TicketingView.swift
//  Megabox
//
//  Created by 이준성 on 4/4/26.
//

import SwiftUI

struct TicketingView: View {
    @StateObject var viewModel = TicketingViewModel()
    
    @State private var isShowingSearchSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            TicketingHeader
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    MovieSelectSection
                    TheaterBtn
                    DateSelectSection
                    ShowtimeSection
                }
            }
            .padding(.horizontal, 16)
        }
        .sheet(isPresented: $isShowingSearchSheet) {
            MovieSearchView(ticketingViewModel: viewModel)
        }
    }
    
    // MARK: 영화별 예매 헤더
    private var TicketingHeader: some View {
        HStack {
            Text("영화별 예매")
                .font(.bold22)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .padding(.top, 31)
        .background(Color.purple03)
    }

    // MARK: 영화 선택 섹션
    private var MovieSelectSection: some View {
        VStack {
            HStack(spacing: 0) {
                if let movie = viewModel.selectedMovie {
                    Text(movie.rating)
                        .foregroundStyle(.white)
                        .font(.bold18)
                        .frame(width: 23, height: 23)
                        .background(movie.rating == "19" ? Color.red : Color.customOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .padding(.trailing, 37)
                    
                    Text(movie.movieTitle)
                        .font(.bold18)
                        .frame(width: 238, height: 23, alignment: .leading)
                }
                
                Spacer()
                
                Button(action: {
                    isShowingSearchSheet = true
                }) {
                    Text("전체영화")
                        .font(.semiBold14)
                        .foregroundStyle(.black)
                }
                .buttonStyle(.glass)
            }
            .padding(.top, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 7) {
                    ForEach(viewModel.movies) { movie in
                        Image(movie.movieImg)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 63, height: 89)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(viewModel.selectedMovieId == movie.id ? Color.purple03 : Color.clear, lineWidth: 2)
                            )
                            .onTapGesture {
                                viewModel.selectedMovieId = movie.id
                            }
                    }
                    .padding(1)
                }
            }
            .padding(.top, 20)
        }
        .padding(.top, 10)
    }
    
    // MARK: 극장 선택 버튼
    private var TheaterBtn: some View {
        HStack(spacing: 8) {
            ForEach(["강남", "신촌", "홍대"], id: \.self) { theater in
                Button {
                    // Set을 활용한 토글 (있으면 빼고, 없으면 넣고)
                    if viewModel.selectedTheaters.contains(theater) {
                        viewModel.selectedTheaters.remove(theater)
                    } else {
                        viewModel.selectedTheaters.insert(theater)
                    }
                } label: {
                    Text(theater)
                        .font(.semiBold16)
                        .foregroundStyle(viewModel.selectedTheaters.contains(theater) ? .white : (viewModel.isTheaterEnabled ? .black : .gray05))
                        .padding(10)
                        .padding(.horizontal, 4)
                        .background(viewModel.selectedTheaters.contains(theater) ? Color.purple03 : Color.gray01)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .disabled(!viewModel.isTheaterEnabled)
            }
            Spacer()
        }
        .padding(.top, 15)
    }
    
    // MARK: 날짜 선택 섹션
    private var DateSelectSection: some View {
        HStack(spacing: 0) {
            ForEach(viewModel.availableDates, id: \.self) { date in
                Button(action: {
                    viewModel.selectedDate = date
                }) {
                    VStack(spacing: 6) {
                        Text(date.weekdayString)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(viewModel.selectedDate == date ? .white : (
                                date.weekdayString == "일" ? .red : (date.weekdayString == "토" ? .blue : .gray05)
                            ))
                            
                        Text(date.dayString)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(viewModel.selectedDate == date ? .white : .black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(viewModel.selectedDate == date ? Color.purple03 : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(!viewModel.isDateEnabled)
            }
        }
        .opacity(viewModel.isDateEnabled ? 1.0 : 0.4)
        .padding(.top, 15)
    }
    
    // MARK: 상영관 및 시간표 섹션 (조건부 노출 로직)
    private var ShowtimeSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 💡 1. 세 가지 모두 선택되었는가?
            if viewModel.canShowShowtimes {
                
                // 💡 2. 오늘 날짜가 아닌가? -> 데이터 없음 표시 (체크리스트 요구사항)
                if !viewModel.isTodaySelected {
                    Text("선택한 극장에 상영시간표가 없습니다.")
                        .font(.medium14)
                        .foregroundColor(.gray03)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                } else {
                    // 💡 3. 오늘이고 데이터가 있다면 극장별로 렌더링
                    ForEach(Array(viewModel.selectedTheaters).sorted(), id: \.self) { theater in
                        VStack(alignment: .leading, spacing: 16) {
                            // 극장 이름 (ex: 강남)
                            Text(theater)
                                .font(.bold18)
                            
                            // 해당 극장의 상영관 목록이 있는지 확인 (신촌은 없으므로 else로 빠짐)
                            if let screens = viewModel.mockTheaterSchedule[theater] {
                                ForEach(screens) { screen in
                                    ScreenTimeGridView(screen: screen)
                                }
                            } else {
                                // 데이터가 없는 극장(신촌) 처리
                                Text("선택한 극장에 상영시간표가 없습니다.")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                            }
                        }
                        .padding(.top, 10)
                    }
                }
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 50)
    }
}

// MARK: - 💡 독립된 서브 뷰 (상영관 하나에 대한 그리드 UI)
struct ScreenTimeGridView: View {
    let screen: ScreenData
    
    // 4열 그리드 레이아웃 설정
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(screen.screenName)
                    .font(.bold18)
                Spacer()
                Text(screen.movieFormat)
                    .font(.semiBold14)
            }
            .padding(.bottom, 21)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(screen.showtimes) { time in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(time.startTime)
                            .font(.bold18)
                        Text(time.endTime)
                            .font(.regular12)
                            .foregroundColor(.gray03)
                        
                        HStack(spacing: 2) {
                            Text("\(time.availableSeats)")
                                .foregroundColor(Color.purple03)
                                .font(.semiBold14)
                            Text("/ \(time.totalSeats)")
                                .foregroundColor(.gray03)
                                .font(.semiBold14)
                        }
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray02, lineWidth: 1)
                    )
                }
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    TicketingView()
}
