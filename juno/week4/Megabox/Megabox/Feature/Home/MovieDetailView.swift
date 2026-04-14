//
//  MovieDetailView.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//
import SwiftUI

struct MovieDetailView: View {
    let movie: MovieInfoModel
    
    //(0: 상세 정보, 1: 실관람평)
    @State private var selectedTab: Int = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                //상단 이미지
                Image(movie.detailImg)
                    .resizable()
                    .scaledToFit()
                
                //제목 및 줄거리
                VStack(alignment: .leading, spacing: 20) {
                    VStack(spacing: 4) {
                        Text(movie.movieTitle)
                            .font(.bold24)
                        Text(movie.engtitle)
                            .font(.medium14)
                            .foregroundStyle(.gray03)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 9)
                    
                    Text(movie.synopsis)
                        .font(.system(size: 15))
                        .foregroundStyle(.gray03)
                        .lineSpacing(1) // 줄간격
                }
                .padding(.horizontal, 15)
                
                //탭 바 (상세 정보 / 실관람평)
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        // 상세 정보 탭 버튼
                        Button {
                            selectedTab = 0
                        } label: {
                            VStack(spacing: 12) {
                                Text("상세 정보")
                                    .font(.bold18)
                                    .foregroundStyle(selectedTab == 0 ? .black : .gray02)
                                Rectangle()
                                    .fill(selectedTab == 0 ? Color.black : Color.clear)
                                    .frame(height: 2)
                            }
                        }
                        
                        // 실관람평 탭 버튼
                        Button {
                            selectedTab = 1
                        } label: {
                            VStack(spacing: 12) {
                                Text("실관람평")
                                    .font(.bold18)
                                    .foregroundStyle(selectedTab == 1 ? .black : .gray02)
                                Rectangle()
                                    .fill(selectedTab == 1 ? Color.black : Color.clear)
                                    .frame(height: 2)
                            }
                        }
                    }
                    Divider()
                }
                .padding(.top, 14)
                
                //선택된 탭에 따른 뷰
                if selectedTab == 0 {
                    DetailInfoSection
                } else {
                    // 실관람평 탭 내용
                    Text(movie.userReviews)
                        .foregroundColor(.gray08)
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                }
            }
        }
        .navigationTitle(movie.movieTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var DetailInfoSection: some View {
        VStack(alignment: .leading) {
            
            // 썸네일 포스터 및 기본 관람 정보
            HStack(alignment: .center, spacing: 16) {
                Image(movie.movieImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 43, height: 61)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(movie.rating)세 이상 관람가")
                        .font(.semiBold14)
                    Text("\(movie.releaseDate)개봉 • \(movie.runningTime)분")
                        .font(.semiBold14)
                }
            }
            
            Divider()
            
            // 감독, 출연진 등 상세 스펙 리스트
            VStack(alignment: .leading, spacing: 4) {
                InfoRow(title: "장르", value: movie.genre)
                InfoRow(title: "타입", value: movie.format)
                InfoRow(title: "감독", value: movie.director)
                InfoRow(title: "출연", value: movie.cast)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
    
    private func InfoRow(title: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Text(title)
                .font(.semiBold13)
                .foregroundColor(.gray04)
                .frame(width: 30, alignment: .leading)
            
            Text(value)
                .font(.semiBold13)
                .lineLimit(2)
        }
    }
}


#Preview {
    NavigationStack {
        MovieDetailView(movie: MovieInfoModel(
            movieImg: "kingsWardenPoster",
            movieTitle: "왕과 사는 남자",
            totalAdmissions: 1475,
            detailImg: "kingsWardenDetailPoster",
            engtitle: "The King's Warden",
            synopsis: "“나는 이제 어디로 갑니까...”\n\n계유정난이 조선을 뒤흔들고\n어린 왕 이홍위는 왕위에서 쫓겨나 유배길에 오른다.\n“무슨 수를 쓰더라도 그 대감을 우리 광천골로 오게 해야지”\n한편, 강원도 영월 산골 마을 광천골의 촌장 엄흥도는 먹고 살기 \n힘든 마을 사람들을 위해 청령포를 유배지로 만들기 위해 노력한다.\n그러나 촌장이 부푼 꿈으로 맞이한 이는 왕위에서 쫓겨난 이홍위였다.\n유배지를 지키는 보수주인으로서 그의 모든 일상을 감시해야만 하는 촌장은 삶의 의지를 잃어버린 이홍위가 점점 신경쓰이는데...\n\n1475년 청령포, 역사가 지우려 했던 이야기.",
            rating: "12",
            releaseDate: "2026.02.04.",
            runningTime: "117",
            genre: "드라마, 사극",
            format: "2D, 2D ATMOS, 디지털영문자막",
            director: "장항준",
            cast: "유해진, 박지훈, 유지태, 전미도, 김민, 박지환, 이준혁, 안재홍",
            userReviews: "등록된 관람평이 없어요"
        ))
    }
}
