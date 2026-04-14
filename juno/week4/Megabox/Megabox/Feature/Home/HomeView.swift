//
//  HomeView.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//


import SwiftUI

enum TopTab: String, CaseIterable {
    case home = "홈"
    case event = "이벤트"
    case store = "스토어"
    case theater = "선호극장"
}

struct HomeView: View {
    @State var cardViewModel = CardViewModel()
    
    @State private var selectedTopTab: TopTab = .home

    var body: some View {

        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack{
                    MovieCardSection
                    MidleTitleSection
                    TheaterView()
                }
                .padding(.horizontal, 16)
            }
            
            // MARK: 상단 고정 탭바
            .safeAreaBar(edge: .top) {
                VStack(spacing: 12) {
                    HeaderLogo
                    
                    HStack(spacing: 31) {
                        ForEach(TopTab.allCases, id: \.self) { tab in
                            Button(action: {
                                withAnimation {
                                    selectedTopTab = tab
                                }
                            }) {
                                Text(tab.rawValue)
                                    .foregroundStyle(selectedTopTab == tab ? .black : .gray04)
                            }
                        }
                        Spacer()
                    }
                    .font(.semiBold24)
                }
                .padding(.top, 8)
                .padding(.horizontal, 16)

            }
        }
    }
    
    private var HeaderLogo: some View {
        HStack {
            Image("megaboxLogo1")
            Spacer()
        }
    }

    // MARK: 무비 카드 section
    private var MovieCardSection: some View {
        VStack{
            HStack(spacing: 23){
                Button {
                    cardViewModel.selectedTab = .chart
                } label: {
                    Text("무비차트")
                        .foregroundStyle(cardViewModel.selectedTab == .chart ? .white : .gray04)
                        .frame(width: 84, height: 38)
                        .background(cardViewModel.selectedTab == .chart ? .gray08 : .gray02)
                        .clipShape(Capsule())
                }
                Button {
                    cardViewModel.selectedTab = .upcoming
                } label: {
                    Text("상영예정")
                        .foregroundStyle(cardViewModel.selectedTab == .upcoming ? .white : .gray04)
                        .frame(width: 84, height: 38)
                        .background(cardViewModel.selectedTab == .upcoming ? .gray08 : .gray02)
                        .clipShape(Capsule())
                }
                Spacer()
            }
            .padding(.top, 9)
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(spacing: 24){
                    ForEach(cardViewModel.currentMovies) { movie in
                        NavigationLink{
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieCardView(movie: movie)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.top, 25)
        }
    }
    
    // MARK: 특별관 글, 버튼
    private var MidleTitleSection: some View{
        HStack{
            Text("메가박스의 모든 특별관")
                .font(.bold24)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 25))
                    .foregroundStyle(.black)
                    .padding(1)
            }
            .buttonBorderShape(.circle)
            .buttonStyle(.glass)
            
        }
        .padding(.top, 25)
    }
    
}



#Preview {
    HomeView()
}


