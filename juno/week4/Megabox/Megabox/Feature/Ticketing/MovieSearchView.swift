//
//  MovieSearchView.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//

import SwiftUI

struct MovieSearchView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var searchViewModel = MovieSearchViewModel()
    
    @ObservedObject var ticketingViewModel: TicketingViewModel
    
    // 3열 그리드 설정
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: 상단 헤더
            Text("영화 선택")
                .font(.system(size: 18, weight: .bold))
                .padding(.top, 25)
                .padding(.bottom, 15)
            
            // MARK: 3열 그리드 영화 리스트
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(searchViewModel.filteredMovies) { movie in
                        VStack(spacing: 8) {
                            Image(movie.movieImg)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 140)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(movie.movieTitle)
                                .font(.semiBold14)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                        .onTapGesture {
                            // 영화 클릭 시 -> 메인 화면 뷰모델 업데이트 후 -> 시트 닫음
                            ticketingViewModel.selectedMovieId = movie.id
                            dismiss()
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
            }
            
            // MARK: 하단 커스텀 검색바 (피그마 디자인)
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
                
                TextField("영화명을 입력해주세요", text: $searchViewModel.searchText)
                    .font(.medium17)
                
                Image(systemName: "mic")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
                
                Button(action: {
                    searchViewModel.searchText = "" // x버튼 누르면 초기화
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(uiColor: .systemGray6))
            .cornerRadius(30)
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    MovieSearchView(ticketingViewModel: TicketingViewModel())
}
