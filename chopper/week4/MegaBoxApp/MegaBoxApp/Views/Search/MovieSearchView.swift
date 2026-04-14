//
//  MovieSearchView.swift
//  MegaBoxApp
//
//  Created by 한지민 on 4/6/26.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject private var vm = MovieSearchViewModel()
    @Binding var selectedMovieIndex: Int?
    @Binding var isShowMovieSearch: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Text("영화 선택")
                    .font(.pretendard(.bold, size: 22))
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                
                TextField("영화명을 입력해주세요", text: $vm.query)
                    .padding(.horizontal, 16)
                    .frame(height: 44)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 20)
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 20
                    
                ) {
                    ForEach(vm.results.indices, id: \.self) { index in
                        Button {
                            if vm.results[index] == "왕과 사는 남자" {
                                selectedMovieIndex = 0
                            } else if vm.results[index] == "프로젝트 헤일메리" {
                                selectedMovieIndex = 1
                            } else if vm.results[index] == "호퍼스" {
                                selectedMovieIndex = 2
                            } else if vm.results[index] == "휴민트" {
                                selectedMovieIndex = 3
                            } else if vm.results[index] == "매드 댄스 오피스" {
                                selectedMovieIndex = 4
                            } else if vm.results[index] == "메소드 연기" {
                                selectedMovieIndex = 5
                            } else if vm.results[index] == "28년 후" {
                                selectedMovieIndex = 6
                            }
                            
                            isShowMovieSearch = false
                        } label: {
                            VStack(spacing: 8) {
                                if vm.results[index] == "왕과 사는 남자" {
                                    Image("kings")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else if vm.results[index] == "프로젝트 헤일메리" {
                                    Image("hail")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else if vm.results[index] == "호퍼스" {
                                    Image("hoppers")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else if vm.results[index] == "휴민트" {
                                    Image("humint")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else if vm.results[index] == "매드 댄스 오피스" {
                                    Image("madDance")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else if vm.results[index] == "메소드 연기" {
                                    Image("method")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else if vm.results[index] == "28년 후" {
                                    Image("years")
                                        .resizable()
                                        .frame(width: 96, height: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                                
                                Text(vm.results[index])
                                    .font(.pretendard(.regular, size: 12))
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
            }
        }
        .background(.white)
    }
}

#Preview {
    MovieSearchView(
        selectedMovieIndex: .constant(nil),
        isShowMovieSearch: .constant(false)
    )
}
