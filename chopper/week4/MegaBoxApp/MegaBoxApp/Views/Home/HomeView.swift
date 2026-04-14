//
//  HomeView.swift
//  MegaBoxApp
//
//  Created by 한지민 on 3/30/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel() //데이터 저장
    @State private var isMoveToDetail: Bool = false //버튼 눌렀는지(이동해야되는지..?) 저장
    @State private var selectedIndex: Int = 0 //선택된 버튼 번호 저장
    let iconList = [
            "logo1", "logo2", "logo3", "logo4", "logo5",
            "logo6", "logo7", "logo8", "logo9", "logo10"
        ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) { //위아래 스크롤
                VStack(alignment: .leading, spacing: 0) { // 왼쪽 정렬, 위 아래 여백제거
                    
                    movieChartSection
                    
                    specialSection
                        .padding(.top, 25)
                }
                .padding(.horizontal, 16)
            }
            
            //.toolbarBackground(.hidden, for: .navigationBar) // 로고 배경 없애기
            
            .safeAreaBar(edge: .top) {
                VStack(alignment: .leading, spacing: 9) {
                    Image("megaboxLogo 1")
                    homeSegmentSection
                    chartMenuSection
                        .padding(.bottom,25)
                }
                .padding(.horizontal, 16)
            }
            .navigationDestination(isPresented: $isMoveToDetail) {
                MovieDetailView(
                    title: viewModel.selectedMovie?.title ?? "",
                    englishTitle: viewModel.selectedMovie?.englishTitle ?? "",
                    imageName: viewModel.selectedMovie?.detailImageName ?? "",
                    description: viewModel.selectedMovie?.description ?? "",
                    age: viewModel.selectedMovie?.age ?? "",
                    openInfo: viewModel.selectedMovie?.openInfo ?? "",
                    genre: viewModel.selectedMovie?.genre ?? "",
                    type: viewModel.selectedMovie?.type ?? "",
                    director: viewModel.selectedMovie?.director ?? "",
                    cast: viewModel.selectedMovie?.cast ?? ""
                )
            }
        }
    }
    
    private var homeSegmentSection: some View {
        HStack(spacing: 20) {
            Text("홈")
                .font(.pretendard(.semi, size: 24))
                .foregroundStyle(.black)
            
            Text("이벤트")
                .font(.pretendard(.semi, size: 24))
                .foregroundStyle(Color.gray04)
            
            Text("스토어")
                .font(.pretendard(.semi, size: 24))
                .foregroundStyle(Color.gray04)
            
            Text("선호극장")
                .font(.pretendard(.semi, size: 24))
                .foregroundStyle(Color.gray04)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chartMenuSection: some View {
        HStack(spacing: 12) {
            Button {
                
            } label: {
                Text("무비차트")
                    .font(.pretendard(.medium, size: 14))
                    .foregroundColor(.white)
                    .padding(.vertical, 10.5)
                    .padding(.horizontal, 18.5)
                    .background(Color.gray08)
                    .cornerRadius(20)
            }
            
            Button {
                
            } label: {
                Text("상영예정")
                    .font(.pretendard(.medium, size: 14))
                    .foregroundColor(.gray04)
                    .padding(.vertical, 10.5)
                    .padding(.horizontal, 18.5)
                    .background(Color.gray02)
                    .cornerRadius(20)
            }
        }
    }
    
    private var movieChartSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {//영화 좌우 스크롤
            HStack(spacing: 24) {
                ForEach(viewModel.movieList) { movie in
                    movieCard(movie)
                        .onTapGesture {
                            viewModel.selectedMovie = movie
                            isMoveToDetail.toggle() //영화 카드 누르면 MoveToDetail로 이동
                        }
                }
            }
        }
    }
    
    private func movieCard(_ movie: MovieModel) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(movie.cardImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 148, height: 209)
                .clipped()
            
            Button {
                
            } label: {
                Text("바로 예매")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.mainPurple)
                    .frame(maxWidth: .infinity)
                    .frame(width:148,  height: 36)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.mainPurple, lineWidth: 1)
                    }
            }
            .padding(.top, 10)
            
            Text(movie.title)
                .font(.pretendard(.bold, size: 22))
                .foregroundStyle(.black)
                .padding(.top, 8)
                .padding(.bottom, 5)
            
            Text("누적관객수 \(movie.audience)")
                .font(.pretendard(.medium, size: 18))
                .foregroundStyle(Color.black)
        }
        .frame(width: 148)
    }
    
    private var specialSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("메가박스의 모든 특별관")
                    .font(.pretendard(.bold, size: 24))
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 19, weight: .semibold))
                        .foregroundStyle(.black)
                        .frame(width: 48, height: 48)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        Button {
                            selectedIndex = index
                        } label: {
                            VStack(spacing: 7) {
                                //MARK: 선택 버튼 흰색+보라색 점
                                if selectedIndex == index {
                                    // 현재 버튼이 선택된 버튼인가?
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 70, height: 70)
                                    
                                    //MARK: 로고 집어넣기
                                        .overlay {
                                            Image(iconList[index])
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 56, height: 56)
                                        }
                                    
                                        .overlay {
                                            Circle()
                                                .stroke(Color.black.opacity(0.05), lineWidth: 1)
                                        }
                                        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 2)
                                    
                                    Circle()
                                        .fill(Color.mainPurple)
                                        .frame(width: 12, height: 12)
                                    
                                } else {
                                    Circle()
                                        .fill(Color.gray02)
                                        .frame(width: 70, height: 70)
                                        .overlay {
                                            Image(iconList[index])
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 56, height: 56)
                                        }
                                    
                                    Circle()
                                        .fill(.clear)
                                        .frame(width: 12, height: 12)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 16)
            }
            
            Image("dolbyCinema")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .cornerRadius(16)
                .padding(.top, 15)
        }
    }
}

#Preview {
    HomeView()
}
